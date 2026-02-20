# SConstruct file for Arcane Forge
# This file is required by SCons in the root directory to start the build process.
# It delegates the build to the main SConstruct in the Arcane  Forge subdirectory.

try:
	from SCons.Script import SConscript
except ImportError:
	import SCons
	SConscript = SCons.Script.SConscript
SConscript('Arcane  Forge/SConstruct')
