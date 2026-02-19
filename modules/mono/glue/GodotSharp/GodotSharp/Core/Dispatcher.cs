using System;
using System.Runtime.InteropServices;
using Test Game Engine.NativeInterop;

namespace Test Game Engine
{
    public static class Dispatcher
    {
        internal static GodotTaskScheduler DefaultGodotTaskScheduler;

        internal static void InitializeDefaultGodotTaskScheduler()
        {
            DefaultGodotTaskScheduler?.Dispose();
            DefaultGodotTaskScheduler = new GodotTaskScheduler();
        }

        public static GodotSynchronizationContext SynchronizationContext => DefaultGodotTaskScheduler.Context;
    }
}
