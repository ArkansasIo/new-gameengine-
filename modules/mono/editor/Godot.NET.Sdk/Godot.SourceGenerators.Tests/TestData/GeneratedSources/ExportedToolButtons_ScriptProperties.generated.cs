using Test Game Engine;
using Test Game Engine.NativeInterop;

partial class ExportedToolButtons
{
#pragma warning disable CS0109 // Disable warning about redundant 'new' keyword
    /// <summary>
    /// Cached StringNames for the properties and fields contained in this class, for fast lookup.
    /// </summary>
    public new class PropertyName : global::Test Game Engine.GodotObject.PropertyName {
        /// <summary>
        /// Cached name for the 'MyButton1' property.
        /// </summary>
        public new static readonly global::Test Game Engine.StringName @MyButton1 = "MyButton1";
        /// <summary>
        /// Cached name for the 'MyButton2' property.
        /// </summary>
        public new static readonly global::Test Game Engine.StringName @MyButton2 = "MyButton2";
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool GetGodotClassPropertyValue(in godot_string_name name, out godot_variant value)
    {
        if (name == PropertyName.@MyButton1) {
            value = global::Test Game Engine.NativeInterop.VariantUtils.CreateFrom<global::Test Game Engine.Callable>(this.@MyButton1);
            return true;
        }
        if (name == PropertyName.@MyButton2) {
            value = global::Test Game Engine.NativeInterop.VariantUtils.CreateFrom<global::Test Game Engine.Callable>(this.@MyButton2);
            return true;
        }
        return base.GetGodotClassPropertyValue(name, out value);
    }
    /// <summary>
    /// Get the property information for all the properties declared in this class.
    /// This method is used by Test Game Engine to register the available properties in the editor.
    /// Do not call this method.
    /// </summary>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    internal new static global::System.Collections.Generic.List<global::Test Game Engine.Bridge.PropertyInfo> GetGodotPropertyList()
    {
        var properties = new global::System.Collections.Generic.List<global::Test Game Engine.Bridge.PropertyInfo>();
        properties.Add(new(type: (global::Test Game Engine.Variant.Type)25, name: PropertyName.@MyButton1, hint: (global::Test Game Engine.PropertyHint)39, hintString: "Click me!", usage: (global::Test Game Engine.PropertyUsageFlags)4, exported: true));
        properties.Add(new(type: (global::Test Game Engine.Variant.Type)25, name: PropertyName.@MyButton2, hint: (global::Test Game Engine.PropertyHint)39, hintString: "Click me!,ColorRect", usage: (global::Test Game Engine.PropertyUsageFlags)4, exported: true));
        return properties;
    }
#pragma warning restore CS0109
}
