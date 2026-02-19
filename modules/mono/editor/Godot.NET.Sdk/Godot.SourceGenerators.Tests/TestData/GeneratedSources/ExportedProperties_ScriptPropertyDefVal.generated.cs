partial class ExportedProperties
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
        var values = new global::System.Collections.Generic.Dictionary<global::Test Game Engine.StringName, global::Test Game Engine.Variant>(71);
        string __NotGenerateComplexLamdaProperty_default_value = default;
        values.Add(PropertyName.@NotGenerateComplexLamdaProperty, global::Test Game Engine.Variant.From<string>(__NotGenerateComplexLamdaProperty_default_value));
        string __NotGenerateLamdaNoFieldProperty_default_value = default;
        values.Add(PropertyName.@NotGenerateLamdaNoFieldProperty, global::Test Game Engine.Variant.From<string>(__NotGenerateLamdaNoFieldProperty_default_value));
        string __NotGenerateComplexReturnProperty_default_value = default;
        values.Add(PropertyName.@NotGenerateComplexReturnProperty, global::Test Game Engine.Variant.From<string>(__NotGenerateComplexReturnProperty_default_value));
        string __NotGenerateReturnsProperty_default_value = default;
        values.Add(PropertyName.@NotGenerateReturnsProperty, global::Test Game Engine.Variant.From<string>(__NotGenerateReturnsProperty_default_value));
        string __FullPropertyString_default_value = "FullPropertyString";
        values.Add(PropertyName.@FullPropertyString, global::Test Game Engine.Variant.From<string>(__FullPropertyString_default_value));
        string __FullPropertyString_Complex_default_value = new string("FullPropertyString_Complex")   + global::System.Convert.ToInt32("1");
        values.Add(PropertyName.@FullPropertyString_Complex, global::Test Game Engine.Variant.From<string>(__FullPropertyString_Complex_default_value));
        float __FullPropertyStaticImport_default_value = global::Test Game Engine.Mathf.Pi;
        values.Add(PropertyName.@FullPropertyStaticImport, global::Test Game Engine.Variant.From<float>(__FullPropertyStaticImport_default_value));
        string __LamdaPropertyString_default_value = "LamdaPropertyString";
        values.Add(PropertyName.@LamdaPropertyString, global::Test Game Engine.Variant.From<string>(__LamdaPropertyString_default_value));
        float __LambdaPropertyStaticImport_default_value = global::Test Game Engine.Mathf.Tau;
        values.Add(PropertyName.@LambdaPropertyStaticImport, global::Test Game Engine.Variant.From<float>(__LambdaPropertyStaticImport_default_value));
        string __PrimaryCtorParameter_default_value = default;
        values.Add(PropertyName.@PrimaryCtorParameter, global::Test Game Engine.Variant.From<string>(__PrimaryCtorParameter_default_value));
        float __ConstantMath_default_value = 2  * global::Test Game Engine.Mathf.Pi;
        values.Add(PropertyName.@ConstantMath, global::Test Game Engine.Variant.From<float>(__ConstantMath_default_value));
        float __ConstantMathStaticImport_default_value = global::Test Game Engine.Mathf.RadToDeg(2  * global::Test Game Engine.Mathf.Pi);
        values.Add(PropertyName.@ConstantMathStaticImport, global::Test Game Engine.Variant.From<float>(__ConstantMathStaticImport_default_value));
        string __StaticStringAddition_default_value = string.Empty   + string.Empty;
        values.Add(PropertyName.@StaticStringAddition, global::Test Game Engine.Variant.From<string>(__StaticStringAddition_default_value));
        bool __PropertyBoolean_default_value = true;
        values.Add(PropertyName.@PropertyBoolean, global::Test Game Engine.Variant.From<bool>(__PropertyBoolean_default_value));
        char __PropertyChar_default_value = 'f';
        values.Add(PropertyName.@PropertyChar, global::Test Game Engine.Variant.From<char>(__PropertyChar_default_value));
        sbyte __PropertySByte_default_value = 10;
        values.Add(PropertyName.@PropertySByte, global::Test Game Engine.Variant.From<sbyte>(__PropertySByte_default_value));
        short __PropertyInt16_default_value = 10;
        values.Add(PropertyName.@PropertyInt16, global::Test Game Engine.Variant.From<short>(__PropertyInt16_default_value));
        int __PropertyInt32_default_value = 10;
        values.Add(PropertyName.@PropertyInt32, global::Test Game Engine.Variant.From<int>(__PropertyInt32_default_value));
        long __PropertyInt64_default_value = -10_000;
        values.Add(PropertyName.@PropertyInt64, global::Test Game Engine.Variant.From<long>(__PropertyInt64_default_value));
        byte __PropertyByte_default_value = 10;
        values.Add(PropertyName.@PropertyByte, global::Test Game Engine.Variant.From<byte>(__PropertyByte_default_value));
        ushort __PropertyUInt16_default_value = 10;
        values.Add(PropertyName.@PropertyUInt16, global::Test Game Engine.Variant.From<ushort>(__PropertyUInt16_default_value));
        uint __PropertyUInt32_default_value = 10;
        values.Add(PropertyName.@PropertyUInt32, global::Test Game Engine.Variant.From<uint>(__PropertyUInt32_default_value));
        ulong __PropertyUInt64_default_value = 10;
        values.Add(PropertyName.@PropertyUInt64, global::Test Game Engine.Variant.From<ulong>(__PropertyUInt64_default_value));
        float __PropertySingle_default_value = 10;
        values.Add(PropertyName.@PropertySingle, global::Test Game Engine.Variant.From<float>(__PropertySingle_default_value));
        double __PropertyDouble_default_value = 10;
        values.Add(PropertyName.@PropertyDouble, global::Test Game Engine.Variant.From<double>(__PropertyDouble_default_value));
        string __PropertyString_default_value = "foo";
        values.Add(PropertyName.@PropertyString, global::Test Game Engine.Variant.From<string>(__PropertyString_default_value));
        global::Test Game Engine.Vector2 __PropertyVector2_default_value = new(10f, 10f);
        values.Add(PropertyName.@PropertyVector2, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2>(__PropertyVector2_default_value));
        global::Test Game Engine.Vector2I __PropertyVector2I_default_value = global::Test Game Engine.Vector2I.Up;
        values.Add(PropertyName.@PropertyVector2I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2I>(__PropertyVector2I_default_value));
        global::Test Game Engine.Rect2 __PropertyRect2_default_value = new(new global::Test Game Engine.Vector2(10f, 10f), new global::Test Game Engine.Vector2(10f, 10f));
        values.Add(PropertyName.@PropertyRect2, global::Test Game Engine.Variant.From<global::Test Game Engine.Rect2>(__PropertyRect2_default_value));
        global::Test Game Engine.Rect2I __PropertyRect2I_default_value = new(new global::Test Game Engine.Vector2I(10, 10), new global::Test Game Engine.Vector2I(10, 10));
        values.Add(PropertyName.@PropertyRect2I, global::Test Game Engine.Variant.From<global::Test Game Engine.Rect2I>(__PropertyRect2I_default_value));
        global::Test Game Engine.Transform2D __PropertyTransform2D_default_value = global::Test Game Engine.Transform2D.Identity;
        values.Add(PropertyName.@PropertyTransform2D, global::Test Game Engine.Variant.From<global::Test Game Engine.Transform2D>(__PropertyTransform2D_default_value));
        global::Test Game Engine.Vector3 __PropertyVector3_default_value = new(10f, 10f, 10f);
        values.Add(PropertyName.@PropertyVector3, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3>(__PropertyVector3_default_value));
        global::Test Game Engine.Vector3I __PropertyVector3I_default_value = global::Test Game Engine.Vector3I.Back;
        values.Add(PropertyName.@PropertyVector3I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3I>(__PropertyVector3I_default_value));
        global::Test Game Engine.Basis __PropertyBasis_default_value = new global::Test Game Engine.Basis(global::Test Game Engine.Quaternion.Identity);
        values.Add(PropertyName.@PropertyBasis, global::Test Game Engine.Variant.From<global::Test Game Engine.Basis>(__PropertyBasis_default_value));
        global::Test Game Engine.Quaternion __PropertyQuaternion_default_value = new global::Test Game Engine.Quaternion(global::Test Game Engine.Basis.Identity);
        values.Add(PropertyName.@PropertyQuaternion, global::Test Game Engine.Variant.From<global::Test Game Engine.Quaternion>(__PropertyQuaternion_default_value));
        global::Test Game Engine.Transform3D __PropertyTransform3D_default_value = global::Test Game Engine.Transform3D.Identity;
        values.Add(PropertyName.@PropertyTransform3D, global::Test Game Engine.Variant.From<global::Test Game Engine.Transform3D>(__PropertyTransform3D_default_value));
        global::Test Game Engine.Vector4 __PropertyVector4_default_value = new(10f, 10f, 10f, 10f);
        values.Add(PropertyName.@PropertyVector4, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector4>(__PropertyVector4_default_value));
        global::Test Game Engine.Vector4I __PropertyVector4I_default_value = global::Test Game Engine.Vector4I.One;
        values.Add(PropertyName.@PropertyVector4I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector4I>(__PropertyVector4I_default_value));
        global::Test Game Engine.Projection __PropertyProjection_default_value = global::Test Game Engine.Projection.Identity;
        values.Add(PropertyName.@PropertyProjection, global::Test Game Engine.Variant.From<global::Test Game Engine.Projection>(__PropertyProjection_default_value));
        global::Test Game Engine.Aabb __PropertyAabb_default_value = new global::Test Game Engine.Aabb(10f, 10f, 10f, new global::Test Game Engine.Vector3(1f, 1f, 1f));
        values.Add(PropertyName.@PropertyAabb, global::Test Game Engine.Variant.From<global::Test Game Engine.Aabb>(__PropertyAabb_default_value));
        global::Test Game Engine.Color __PropertyColor_default_value = global::Test Game Engine.Colors.Aquamarine;
        values.Add(PropertyName.@PropertyColor, global::Test Game Engine.Variant.From<global::Test Game Engine.Color>(__PropertyColor_default_value));
        global::Test Game Engine.Plane __PropertyPlane_default_value = global::Test Game Engine.Plane.PlaneXZ;
        values.Add(PropertyName.@PropertyPlane, global::Test Game Engine.Variant.From<global::Test Game Engine.Plane>(__PropertyPlane_default_value));
        global::Test Game Engine.Callable __PropertyCallable_default_value = new global::Test Game Engine.Callable(global::Test Game Engine.Engine.GetMainLoop(), "_process");
        values.Add(PropertyName.@PropertyCallable, global::Test Game Engine.Variant.From<global::Test Game Engine.Callable>(__PropertyCallable_default_value));
        global::Test Game Engine.Signal __PropertySignal_default_value = new global::Test Game Engine.Signal(global::Test Game Engine.Engine.GetMainLoop(), "Propertylist_changed");
        values.Add(PropertyName.@PropertySignal, global::Test Game Engine.Variant.From<global::Test Game Engine.Signal>(__PropertySignal_default_value));
        global::ExportedProperties.MyEnum __PropertyEnum_default_value = global::ExportedProperties.MyEnum.C;
        values.Add(PropertyName.@PropertyEnum, global::Test Game Engine.Variant.From<global::ExportedProperties.MyEnum>(__PropertyEnum_default_value));
        global::ExportedProperties.MyFlagsEnum __PropertyFlagsEnum_default_value = global::ExportedProperties.MyFlagsEnum.C;
        values.Add(PropertyName.@PropertyFlagsEnum, global::Test Game Engine.Variant.From<global::ExportedProperties.MyFlagsEnum>(__PropertyFlagsEnum_default_value));
        byte[] __PropertyByteArray_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@PropertyByteArray, global::Test Game Engine.Variant.From<byte[]>(__PropertyByteArray_default_value));
        int[] __PropertyInt32Array_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@PropertyInt32Array, global::Test Game Engine.Variant.From<int[]>(__PropertyInt32Array_default_value));
        long[] __PropertyInt64Array_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@PropertyInt64Array, global::Test Game Engine.Variant.From<long[]>(__PropertyInt64Array_default_value));
        float[] __PropertySingleArray_default_value = { 0f, 1f, 2f, 3f, 4f, 5f, 6f  };
        values.Add(PropertyName.@PropertySingleArray, global::Test Game Engine.Variant.From<float[]>(__PropertySingleArray_default_value));
        double[] __PropertyDoubleArray_default_value = { 0d, 1d, 2d, 3d, 4d, 5d, 6d  };
        values.Add(PropertyName.@PropertyDoubleArray, global::Test Game Engine.Variant.From<double[]>(__PropertyDoubleArray_default_value));
        string[] __PropertyStringArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@PropertyStringArray, global::Test Game Engine.Variant.From<string[]>(__PropertyStringArray_default_value));
        string[] __PropertyStringArrayEnum_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@PropertyStringArrayEnum, global::Test Game Engine.Variant.From<string[]>(__PropertyStringArrayEnum_default_value));
        global::Test Game Engine.Vector2[] __PropertyVector2Array_default_value = { global::Test Game Engine.Vector2.Up, global::Test Game Engine.Vector2.Down, global::Test Game Engine.Vector2.Left, global::Test Game Engine.Vector2.Right   };
        values.Add(PropertyName.@PropertyVector2Array, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2[]>(__PropertyVector2Array_default_value));
        global::Test Game Engine.Vector3[] __PropertyVector3Array_default_value = { global::Test Game Engine.Vector3.Up, global::Test Game Engine.Vector3.Down, global::Test Game Engine.Vector3.Left, global::Test Game Engine.Vector3.Right   };
        values.Add(PropertyName.@PropertyVector3Array, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3[]>(__PropertyVector3Array_default_value));
        global::Test Game Engine.Color[] __PropertyColorArray_default_value = { global::Test Game Engine.Colors.Aqua, global::Test Game Engine.Colors.Aquamarine, global::Test Game Engine.Colors.Azure, global::Test Game Engine.Colors.Beige   };
        values.Add(PropertyName.@PropertyColorArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Color[]>(__PropertyColorArray_default_value));
        global::Test Game Engine.GodotObject[] __PropertyGodotObjectOrDerivedArray_default_value = { null  };
        values.Add(PropertyName.@PropertyGodotObjectOrDerivedArray, global::Test Game Engine.Variant.CreateFrom(__PropertyGodotObjectOrDerivedArray_default_value));
        global::Test Game Engine.StringName[] __field_StringNameArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@field_StringNameArray, global::Test Game Engine.Variant.From<global::Test Game Engine.StringName[]>(__field_StringNameArray_default_value));
        global::Test Game Engine.NodePath[] __field_NodePathArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@field_NodePathArray, global::Test Game Engine.Variant.From<global::Test Game Engine.NodePath[]>(__field_NodePathArray_default_value));
        global::Test Game Engine.Rid[] __field_RidArray_default_value = { default, default, default  };
        values.Add(PropertyName.@field_RidArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Rid[]>(__field_RidArray_default_value));
        global::Test Game Engine.Variant __PropertyVariant_default_value = "foo";
        values.Add(PropertyName.@PropertyVariant, global::Test Game Engine.Variant.From<global::Test Game Engine.Variant>(__PropertyVariant_default_value));
        global::Test Game Engine.GodotObject __PropertyGodotObjectOrDerived_default_value = default;
        values.Add(PropertyName.@PropertyGodotObjectOrDerived, global::Test Game Engine.Variant.From<global::Test Game Engine.GodotObject>(__PropertyGodotObjectOrDerived_default_value));
        global::Test Game Engine.Texture __PropertyGodotResourceTexture_default_value = default;
        values.Add(PropertyName.@PropertyGodotResourceTexture, global::Test Game Engine.Variant.From<global::Test Game Engine.Texture>(__PropertyGodotResourceTexture_default_value));
        global::Test Game Engine.Texture __PropertyGodotResourceTextureWithInitializer_default_value = new()  { ResourceName  = ""   };
        values.Add(PropertyName.@PropertyGodotResourceTextureWithInitializer, global::Test Game Engine.Variant.From<global::Test Game Engine.Texture>(__PropertyGodotResourceTextureWithInitializer_default_value));
        global::Test Game Engine.StringName __PropertyStringName_default_value = new global::Test Game Engine.StringName("foo");
        values.Add(PropertyName.@PropertyStringName, global::Test Game Engine.Variant.From<global::Test Game Engine.StringName>(__PropertyStringName_default_value));
        global::Test Game Engine.NodePath __PropertyNodePath_default_value = new global::Test Game Engine.NodePath("foo");
        values.Add(PropertyName.@PropertyNodePath, global::Test Game Engine.Variant.From<global::Test Game Engine.NodePath>(__PropertyNodePath_default_value));
        global::Test Game Engine.Rid __PropertyRid_default_value = default;
        values.Add(PropertyName.@PropertyRid, global::Test Game Engine.Variant.From<global::Test Game Engine.Rid>(__PropertyRid_default_value));
        global::Test Game Engine.Collections.Dictionary __PropertyGodotDictionary_default_value = new()  { { "foo", 10  }, { global::Test Game Engine.Vector2.Up, global::Test Game Engine.Colors.Chocolate   }  };
        values.Add(PropertyName.@PropertyGodotDictionary, global::Test Game Engine.Variant.From<global::Test Game Engine.Collections.Dictionary>(__PropertyGodotDictionary_default_value));
        global::Test Game Engine.Collections.Array __PropertyGodotArray_default_value = new()  { "foo", 10, global::Test Game Engine.Vector2.Up, global::Test Game Engine.Colors.Chocolate   };
        values.Add(PropertyName.@PropertyGodotArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Collections.Array>(__PropertyGodotArray_default_value));
        global::Test Game Engine.Collections.Dictionary<string, bool> __PropertyGodotGenericDictionary_default_value = new()  { { "foo", true  }, { "bar", false  }  };
        values.Add(PropertyName.@PropertyGodotGenericDictionary, global::Test Game Engine.Variant.CreateFrom(__PropertyGodotGenericDictionary_default_value));
        global::Test Game Engine.Collections.Array<int> __PropertyGodotGenericArray_default_value = new()  { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@PropertyGodotGenericArray, global::Test Game Engine.Variant.CreateFrom(__PropertyGodotGenericArray_default_value));
        return values;
    }
#endif // TOOLS
#pragma warning restore CS0109
}
