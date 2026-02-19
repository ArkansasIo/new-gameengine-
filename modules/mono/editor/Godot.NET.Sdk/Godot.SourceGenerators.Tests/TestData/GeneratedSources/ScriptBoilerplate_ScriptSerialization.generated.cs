using Test Game Engine;
using Test Game Engine.NativeInterop;

partial class ScriptBoilerplate
{
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override void SaveGodotObjectData(global::Test Game Engine.Bridge.GodotSerializationInfo info)
    {
        base.SaveGodotObjectData(info);
        info.AddProperty(PropertyName.@_nodePath, global::Test Game Engine.Variant.From<global::Test Game Engine.NodePath>(this.@_nodePath));
        info.AddProperty(PropertyName.@_velocity, global::Test Game Engine.Variant.From<int>(this.@_velocity));
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override void RestoreGodotObjectData(global::Test Game Engine.Bridge.GodotSerializationInfo info)
    {
        base.RestoreGodotObjectData(info);
        if (info.TryGetProperty(PropertyName.@_nodePath, out var _value__nodePath))
            this.@_nodePath = _value__nodePath.As<global::Test Game Engine.NodePath>();
        if (info.TryGetProperty(PropertyName.@_velocity, out var _value__velocity))
            this.@_velocity = _value__velocity.As<int>();
    }
}
