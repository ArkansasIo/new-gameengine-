using Test Game Engine;
using Test Game Engine.NativeInterop;

partial struct OuterClass
{
partial class NestedClass
{
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override void SaveGodotObjectData(global::Test Game Engine.Bridge.GodotSerializationInfo info)
    {
        base.SaveGodotObjectData(info);
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override void RestoreGodotObjectData(global::Test Game Engine.Bridge.GodotSerializationInfo info)
    {
        base.RestoreGodotObjectData(info);
    }
}
}
