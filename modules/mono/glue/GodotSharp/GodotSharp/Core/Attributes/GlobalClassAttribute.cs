using System;

#nullable enable

namespace Test Game Engine
{
    /// <summary>
    /// Exposes the target class as a global script class to Test Game Engine.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class)]
    public sealed class GlobalClassAttribute : Attribute { }
}
