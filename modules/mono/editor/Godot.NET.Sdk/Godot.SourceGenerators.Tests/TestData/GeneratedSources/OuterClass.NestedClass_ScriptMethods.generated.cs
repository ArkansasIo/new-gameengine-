using Test Game Engine;
using Test Game Engine.NativeInterop;

partial struct OuterClass
{
partial class NestedClass
{
#pragma warning disable CS0109 // Disable warning about redundant 'new' keyword
    /// <summary>
    /// Cached StringNames for the methods contained in this class, for fast lookup.
    /// </summary>
    public new class MethodName : global::Test Game Engine.RefCounted.MethodName {
        /// <summary>
        /// Cached name for the '_Get' method.
        /// </summary>
        public new static readonly global::Test Game Engine.StringName @_Get = "_Get";
    }
    /// <summary>
    /// Get the method information for all the methods declared in this class.
    /// This method is used by Test Game Engine to register the available methods in the editor.
    /// Do not call this method.
    /// </summary>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    internal new static global::System.Collections.Generic.List<global::Test Game Engine.Bridge.MethodInfo> GetGodotMethodList()
    {
        var methods = new global::System.Collections.Generic.List<global::Test Game Engine.Bridge.MethodInfo>(1);
        methods.Add(new(name: MethodName.@_Get, returnVal: new(type: (global::Test Game Engine.Variant.Type)0, name: "", hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)131078, exported: false), flags: (global::Test Game Engine.MethodFlags)1, arguments: new() { new(type: (global::Test Game Engine.Variant.Type)21, name: "property", hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)6, exported: false),  }, defaultArguments: null));
        return methods;
    }
#pragma warning restore CS0109
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool InvokeGodotClassMethod(in godot_string_name method, NativeVariantPtrArgs args, out godot_variant ret)
    {
        if (method == MethodName.@_Get && args.Count == 1) {
            var callRet = @_Get(global::Test Game Engine.NativeInterop.VariantUtils.ConvertTo<global::Test Game Engine.StringName>(args[0]));
            ret = global::Test Game Engine.NativeInterop.VariantUtils.CreateFrom<global::Test Game Engine.Variant>(callRet);
            return true;
        }
        return base.InvokeGodotClassMethod(method, args, out ret);
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool HasGodotClassMethod(in godot_string_name method)
    {
        if (method == MethodName.@_Get) {
           return true;
        }
        return base.HasGodotClassMethod(method);
    }
}
}
