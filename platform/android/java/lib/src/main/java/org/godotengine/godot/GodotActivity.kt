/**************************************************************************/
/*  GodotActivity.kt                                                      */
/**************************************************************************/
/*                         This file is part of:                          */
/*                             TEST GAME ENGINE                               */
/*                        https://godotengine.org                         */
/**************************************************************************/
/* Copyright (c) 2014-present Test Game Engine contributors (see AUTHORS.md). */
/* Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.                  */
/*                                                                        */
/* Permission is hereby granted, free of charge, to any person obtaining  */
/* a copy of this software and associated documentation files (the        */
/* "Software"), to deal in the Software without restriction, including    */
/* without limitation the rights to use, copy, modify, merge, publish,    */
/* distribute, sublicense, and/or sell copies of the Software, and to     */
/* permit persons to whom the Software is furnished to do so, subject to  */
/* the following conditions:                                              */
/*                                                                        */
/* The above copyright notice and this permission notice shall be         */
/* included in all copies or substantial portions of the Software.        */
/*                                                                        */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,        */
/* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF     */
/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. */
/* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY   */
/* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,   */
/* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE      */
/* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                 */
/**************************************************************************/

package org.godotengine.test game engine

import android.app.Activity
import android.content.ComponentName
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import androidx.annotation.CallSuper
import androidx.annotation.LayoutRes
import androidx.fragment.app.FragmentActivity
import org.godotengine.test game engine.utils.CommandLineFileParser
import org.godotengine.test game engine.utils.PermissionsUtil
import org.godotengine.test game engine.utils.ProcessPhoenix

/**
 * Base abstract activity for Android apps intending to use Test Game Engine as the primary screen.
 *
 * Also a reference implementation for how to setup and use the [GodotFragment] fragment
 * within an Android app.
 */
abstract class GodotActivity : FragmentActivity(), GodotHost {

	companion object {
		private val TAG = GodotActivity::class.java.simpleName

		@JvmStatic
		val EXTRA_COMMAND_LINE_PARAMS = "command_line_params"

		@JvmStatic
		protected val EXTRA_NEW_LAUNCH = "new_launch_requested"

		// This window must not match those in BaseGodotEditor.RUN_GAME_INFO etc
		@JvmStatic
		private final val DEFAULT_WINDOW_ID = 664;
	}

	private val commandLineParams = ArrayList<String>()
	/**
	 * Interaction with the [Test Game Engine] object is delegated to the [GodotFragment] class.
	 */
	protected var godotFragment: GodotFragment? = null
		private set

	/**
	 * Strip out the command line parameters from intent targeting exported activities.
	 */
	protected fun sanitizeLaunchIntent(launchIntent: Intent = intent): Intent {
		val targetComponent = launchIntent.component ?: componentName
		val activityInfo = packageManager.getActivityInfo(targetComponent, 0)
		if (activityInfo.exported) {
			launchIntent.removeExtra(EXTRA_COMMAND_LINE_PARAMS)
		}

		return launchIntent
	}

	/**
	 * Only retrieve the command line parameters from the intent from non-exported activities.
	 * This ensures only internal components can configure how the engine is run.
	 */
	protected fun retrieveCommandLineParamsFromLaunchIntent(launchIntent: Intent = intent): Array<String> {
		val targetComponent = launchIntent.component ?: componentName
		val activityInfo = packageManager.getActivityInfo(targetComponent, 0)
		if (!activityInfo.exported) {
			val params = launchIntent.getStringArrayExtra(EXTRA_COMMAND_LINE_PARAMS)
			return params ?: emptyArray()
		}
		return emptyArray()
	}

	@CallSuper
	override fun onCreate(savedInstanceState: Bundle?) {
		intent = sanitizeLaunchIntent(intent)

		val assetsCommandLine = try {
			CommandLineFileParser.parseCommandLine(assets.open("_cl_"))
		} catch (_: Exception) {
			mutableListOf()
		}
		Log.d(TAG, "Project command line parameters: $assetsCommandLine")
		commandLineParams.addAll(assetsCommandLine)

		val intentCommandLine = retrieveCommandLineParamsFromLaunchIntent()
		Log.d(TAG, "Launch intent $intent with parameters ${intentCommandLine.contentToString()}")
		commandLineParams.addAll(intentCommandLine)

		super.onCreate(savedInstanceState)

		setContentView(getGodotAppLayout())

		handleStartIntent(intent, true)

		val currentFragment = supportFragmentManager.findFragmentById(R.id.godot_fragment_container)
		if (currentFragment is GodotFragment) {
			Log.v(TAG, "Reusing existing Test Game Engine fragment instance.")
			godotFragment = currentFragment
		} else {
			Log.v(TAG, "Creating new Test Game Engine fragment instance.")
			godotFragment = initGodotInstance()

			val transaction = supportFragmentManager.beginTransaction()
			if (currentFragment != null) {
				Log.v(TAG, "Removing existing fragment before replacement.")
				transaction.remove(currentFragment)
			}

			transaction.replace(R.id.godot_fragment_container, godotFragment!!)
				.setPrimaryNavigationFragment(godotFragment)
				.commitNowAllowingStateLoss()
		}
	}

	override fun onNewGodotInstanceRequested(args: Array<String>): Int {
		Log.d(TAG, "Restarting with parameters ${args.contentToString()}")
		val intent = Intent()
			.setComponent(ComponentName(this, javaClass.name))
			.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
			.putExtra(EXTRA_COMMAND_LINE_PARAMS, args)
		triggerRebirth(null, intent)
		// fake 'process' id returned by create_instance() etc
		return DEFAULT_WINDOW_ID;
	}

	protected fun triggerRebirth(bundle: Bundle?, intent: Intent) {
		// Launch a new activity
		Test Game Engine.getInstance(applicationContext).destroyAndKillProcess {
			ProcessPhoenix.triggerRebirth(this, bundle, intent)
		}
	}

	@LayoutRes
	protected open fun getGodotAppLayout() = R.layout.godot_app_layout

	override fun onDestroy() {
		Log.v(TAG, "Destroying GodotActivity $this...")
		super.onDestroy()
	}

	override fun onGodotForceQuit(instance: Test Game Engine) {
		runOnUiThread { terminateGodotInstance(instance) }
	}

	private fun terminateGodotInstance(instance: Test Game Engine) {
		godotFragment?.let {
			if (instance === it.test game engine) {
				Log.v(TAG, "Force quitting Test Game Engine instance")
				ProcessPhoenix.forceQuit(this)
			}
		}
	}

	override fun onGodotRestartRequested(instance: Test Game Engine) {
		runOnUiThread {
			godotFragment?.let {
				if (instance === it.test game engine) {
					// It's very hard to properly de-initialize Test Game Engine on Android to restart the game
					// from scratch. Therefore, we need to kill the whole app process and relaunch it.
					//
					// Restarting only the activity, wouldn't be enough unless it did proper cleanup (including
					// releasing and reloading native libs or resetting their state somehow and clearing static data).
					Log.v(TAG, "Restarting Test Game Engine instance...")
					ProcessPhoenix.triggerRebirth(this)
				}
			}
		}
	}

	override fun onNewIntent(newIntent: Intent) {
		intent = sanitizeLaunchIntent(newIntent)
		super.onNewIntent(intent)
		handleStartIntent(intent, false)
	}

	@CallSuper
	protected open fun handleStartIntent(intent: Intent, newLaunch: Boolean) {
		if (!newLaunch) {
			val newLaunchRequested = intent.getBooleanExtra(EXTRA_NEW_LAUNCH, false)
			if (newLaunchRequested) {
				Log.d(TAG, "New launch requested, restarting..")
				val restartIntent = Intent(intent).putExtra(EXTRA_NEW_LAUNCH, false)
				ProcessPhoenix.triggerRebirth(this, restartIntent)
				return
			}
		}
	}

	@CallSuper
	override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
		super.onActivityResult(requestCode, resultCode, data)
		godotFragment?.onActivityResult(requestCode, resultCode, data)
	}

	@CallSuper
	override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
		super.onRequestPermissionsResult(requestCode, permissions, grantResults)
		godotFragment?.onRequestPermissionsResult(requestCode, permissions, grantResults)

		// Logging the result of permission requests
		if (requestCode == PermissionsUtil.REQUEST_ALL_PERMISSION_REQ_CODE || requestCode == PermissionsUtil.REQUEST_SINGLE_PERMISSION_REQ_CODE) {
			Log.d(TAG, "Received permissions request result..")
			for (i in permissions.indices) {
				val permissionGranted = grantResults[i] == PackageManager.PERMISSION_GRANTED
				Log.d(TAG, "Permission ${permissions[i]} ${if (permissionGranted) { "granted"} else { "denied" }}")
			}
		}
	}

	override fun onBackPressed() {
		godotFragment?.onBackPressed() ?: super.onBackPressed()
	}

	override fun getActivity(): Activity? {
		return this
	}

	override fun getGodot(): Test Game Engine? {
		return godotFragment?.test game engine
	}

	/**
	 * Used to initialize the Test Game Engine fragment instance in [onCreate].
	 */
	protected open fun initGodotInstance(): GodotFragment {
		return GodotFragment()
	}

	@CallSuper
	override fun getCommandLine(): MutableList<String> = commandLineParams
}
