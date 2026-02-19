using Test Game Engine;
using Test Game Engine.NativeInterop;

partial class EventSignals
{
#pragma warning disable CS0109 // Disable warning about redundant 'new' keyword
    /// <summary>
    /// Cached StringNames for the signals contained in this class, for fast lookup.
    /// </summary>
    public new class SignalName : global::Test Game Engine.GodotObject.SignalName {
        /// <summary>
        /// Cached name for the 'MySignal' signal.
        /// </summary>
        public new static readonly global::Test Game Engine.StringName @MySignal = "MySignal";
    }
    /// <summary>
    /// Get the signal information for all the signals declared in this class.
    /// This method is used by Test Game Engine to register the available signals in the editor.
    /// Do not call this method.
    /// </summary>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    internal new static global::System.Collections.Generic.List<global::Test Game Engine.Bridge.MethodInfo> GetGodotSignalList()
    {
        var signals = new global::System.Collections.Generic.List<global::Test Game Engine.Bridge.MethodInfo>(1);
        signals.Add(new(name: SignalName.@MySignal, returnVal: new(type: (global::Test Game Engine.Variant.Type)0, name: "", hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)6, exported: false), flags: (global::Test Game Engine.MethodFlags)1, arguments: new() { new(type: (global::Test Game Engine.Variant.Type)4, name: "str", hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)6, exported: false), new(type: (global::Test Game Engine.Variant.Type)2, name: "num", hint: (global::Test Game Engine.PropertyHint)0, hintString: "", usage: (global::Test Game Engine.PropertyUsageFlags)6, exported: false),  }, defaultArguments: null));
        return signals;
    }
#pragma warning restore CS0109
    private global::EventSignals.MySignalEventHandler backing_MySignal;
    /// <inheritdoc cref="global::EventSignals.MySignalEventHandler"/>
    public event global::EventSignals.MySignalEventHandler @MySignal {
        add => backing_MySignal += value;
        remove => backing_MySignal -= value;
}
    protected void EmitSignalMySignal(string @str, int @num)
    {
        EmitSignal(SignalName.MySignal, @str, @num);
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override void RaiseGodotClassSignalCallbacks(in godot_string_name signal, NativeVariantPtrArgs args)
    {
        if (signal == SignalName.@MySignal && args.Count == 2) {
            backing_MySignal?.Invoke(global::Test Game Engine.NativeInterop.VariantUtils.ConvertTo<string>(args[0]), global::Test Game Engine.NativeInterop.VariantUtils.ConvertTo<int>(args[1]));
            return;
        }
        base.RaiseGodotClassSignalCallbacks(signal, args);
    }
    /// <inheritdoc/>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    protected override bool HasGodotClassSignal(in godot_string_name signal)
    {
        if (signal == SignalName.@MySignal) {
           return true;
        }
        return base.HasGodotClassSignal(signal);
    }
}
