using Test Game Engine;
using Test Game Engine.NativeInterop;

partial class AbstractGenericNode<T>
{
#pragma warning disable CS0109 // Disable warning about redundant 'new' keyword
    /// <summary>
    /// Cached StringNames for the properties and fields contained in this class, for fast lookup.
    /// </summary>
    public new class PropertyName : global::Test Game Engine.Node.PropertyName {
        /// <summary>
        /// Cached name for the 'MyArray' property.
        /// </summary>
        public new static readonly global::Test Game Engine.StringName @MyArray = "MyArray";
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool SetGodotClassPropertyValue(in godot_string_name name, in godot_variant value)
    {
        if (name == PropertyName.@MyArray) {
            this.@MyArray = global::Test Game Engine.NativeInterop.VariantUtils.ConvertToArray<T>(value);
            return true;
        }
        return base.SetGodotClassPropertyValue(name, value);
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool GetGodotClassPropertyValue(in godot_string_name name, out godot_variant value)
    {
        if (name == PropertyName.@MyArray) {
            value = global::Test Game Engine.NativeInterop.VariantUtils.CreateFromArray(this.@MyArray);
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
        properties.Add(new(type: (global::Test Game Engine.Variant.Type)28, name: PropertyName.@MyArray, hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)4102, exported: true));
        return properties;
    }
#pragma warning restore CS0109
}
