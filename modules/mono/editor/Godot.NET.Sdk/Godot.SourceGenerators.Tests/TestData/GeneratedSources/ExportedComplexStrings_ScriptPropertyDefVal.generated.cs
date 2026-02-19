partial class ExportedComplexStrings
{
#pragma warning disable CS0109 // Disable warning about redundant 'new' keyword
#if TOOLS
    /// <summary>
    /// Get the default values for all properties declared in this class.
    /// This method is used by Test Game Engine to determine the value that will be
    /// used by the inspector when resetting properties.
    /// Do not call this method.
    /// </summary>
    [global::System.ComponentModel.EditorBrowsable(global::System.ComponentModel.EditorBrowsableState.Never)]
    internal new static global::System.Collections.Generic.Dictionary<global::Test Game Engine.StringName, global::Test Game Engine.Variant> GetGodotPropertyDefaultValues()
    {
        var values = new global::System.Collections.Generic.Dictionary<global::Test Game Engine.StringName, global::Test Game Engine.Variant>(5);
        string __PropertyInterpolated1_default_value = $"The quick brown fox jumps over {(global::Test Game Engine.GD.VarToStr($"the lazy {(global::Test Game Engine.Engine.GetVersionInfo())} do"))}g.";
        values.Add(PropertyName.@PropertyInterpolated1, global::Test Game Engine.Variant.From<string>(__PropertyInterpolated1_default_value));
        string ___fieldInterpolated1_default_value = $"The quick brown fox jumps over ({(global::Test Game Engine.Engine.GetVersionInfo())})";
        values.Add(PropertyName.@_fieldInterpolated1, global::Test Game Engine.Variant.From<string>(___fieldInterpolated1_default_value));
        string ___fieldInterpolated2_default_value = $"The quick brown fox jumps over ({(global::Test Game Engine.Engine.GetVersionInfo()["major"]),0:G}) the lazy dog.";
        values.Add(PropertyName.@_fieldInterpolated2, global::Test Game Engine.Variant.From<string>(___fieldInterpolated2_default_value));
        string ___fieldInterpolated3_default_value = $"{(((int)global::Test Game Engine.Engine.GetVersionInfo()["major"])  * -1    * -1):G} the lazy dog.";
        values.Add(PropertyName.@_fieldInterpolated3, global::Test Game Engine.Variant.From<string>(___fieldInterpolated3_default_value));
        string ___fieldInterpolated4_default_value = $"{(":::fff,,}<,<}},,}]")}";
        values.Add(PropertyName.@_fieldInterpolated4, global::Test Game Engine.Variant.From<string>(___fieldInterpolated4_default_value));
        return values;
    }
#endif // TOOLS
#pragma warning restore CS0109
}
