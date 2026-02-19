partial class ExportedFields
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
        var values = new global::System.Collections.Generic.Dictionary<global::Test Game Engine.StringName, global::Test Game Engine.Variant>(62);
        bool ___fieldBoolean_default_value = true;
        values.Add(PropertyName.@_fieldBoolean, global::Test Game Engine.Variant.From<bool>(___fieldBoolean_default_value));
        char ___fieldChar_default_value = 'f';
        values.Add(PropertyName.@_fieldChar, global::Test Game Engine.Variant.From<char>(___fieldChar_default_value));
        sbyte ___fieldSByte_default_value = 10;
        values.Add(PropertyName.@_fieldSByte, global::Test Game Engine.Variant.From<sbyte>(___fieldSByte_default_value));
        short ___fieldInt16_default_value = 10;
        values.Add(PropertyName.@_fieldInt16, global::Test Game Engine.Variant.From<short>(___fieldInt16_default_value));
        int ___fieldInt32_default_value = 10;
        values.Add(PropertyName.@_fieldInt32, global::Test Game Engine.Variant.From<int>(___fieldInt32_default_value));
        long ___fieldInt64_default_value = -10_000;
        values.Add(PropertyName.@_fieldInt64, global::Test Game Engine.Variant.From<long>(___fieldInt64_default_value));
        byte ___fieldByte_default_value = 10;
        values.Add(PropertyName.@_fieldByte, global::Test Game Engine.Variant.From<byte>(___fieldByte_default_value));
        ushort ___fieldUInt16_default_value = 10;
        values.Add(PropertyName.@_fieldUInt16, global::Test Game Engine.Variant.From<ushort>(___fieldUInt16_default_value));
        uint ___fieldUInt32_default_value = 10;
        values.Add(PropertyName.@_fieldUInt32, global::Test Game Engine.Variant.From<uint>(___fieldUInt32_default_value));
        ulong ___fieldUInt64_default_value = 10;
        values.Add(PropertyName.@_fieldUInt64, global::Test Game Engine.Variant.From<ulong>(___fieldUInt64_default_value));
        float ___fieldSingle_default_value = 10;
        values.Add(PropertyName.@_fieldSingle, global::Test Game Engine.Variant.From<float>(___fieldSingle_default_value));
        double ___fieldDouble_default_value = 10;
        values.Add(PropertyName.@_fieldDouble, global::Test Game Engine.Variant.From<double>(___fieldDouble_default_value));
        string ___fieldString_default_value = "foo";
        values.Add(PropertyName.@_fieldString, global::Test Game Engine.Variant.From<string>(___fieldString_default_value));
        float ___fieldStaticImport_default_value = global::Test Game Engine.Mathf.RadToDeg(2  * global::Test Game Engine.Mathf.Pi);
        values.Add(PropertyName.@_fieldStaticImport, global::Test Game Engine.Variant.From<float>(___fieldStaticImport_default_value));
        global::Test Game Engine.Vector2 ___fieldVector2_default_value = new(10f, 10f);
        values.Add(PropertyName.@_fieldVector2, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2>(___fieldVector2_default_value));
        global::Test Game Engine.Vector2I ___fieldVector2I_default_value = global::Test Game Engine.Vector2I.Up;
        values.Add(PropertyName.@_fieldVector2I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2I>(___fieldVector2I_default_value));
        global::Test Game Engine.Rect2 ___fieldRect2_default_value = new(new global::Test Game Engine.Vector2(10f, 10f), new global::Test Game Engine.Vector2(10f, 10f));
        values.Add(PropertyName.@_fieldRect2, global::Test Game Engine.Variant.From<global::Test Game Engine.Rect2>(___fieldRect2_default_value));
        global::Test Game Engine.Rect2I ___fieldRect2I_default_value = new(new global::Test Game Engine.Vector2I(10, 10), new global::Test Game Engine.Vector2I(10, 10));
        values.Add(PropertyName.@_fieldRect2I, global::Test Game Engine.Variant.From<global::Test Game Engine.Rect2I>(___fieldRect2I_default_value));
        global::Test Game Engine.Transform2D ___fieldTransform2D_default_value = global::Test Game Engine.Transform2D.Identity;
        values.Add(PropertyName.@_fieldTransform2D, global::Test Game Engine.Variant.From<global::Test Game Engine.Transform2D>(___fieldTransform2D_default_value));
        global::Test Game Engine.Vector3 ___fieldVector3_default_value = new(10f, 10f, 10f);
        values.Add(PropertyName.@_fieldVector3, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3>(___fieldVector3_default_value));
        global::Test Game Engine.Vector3I ___fieldVector3I_default_value = global::Test Game Engine.Vector3I.Back;
        values.Add(PropertyName.@_fieldVector3I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3I>(___fieldVector3I_default_value));
        global::Test Game Engine.Basis ___fieldBasis_default_value = new global::Test Game Engine.Basis(global::Test Game Engine.Quaternion.Identity);
        values.Add(PropertyName.@_fieldBasis, global::Test Game Engine.Variant.From<global::Test Game Engine.Basis>(___fieldBasis_default_value));
        global::Test Game Engine.Quaternion ___fieldQuaternion_default_value = new global::Test Game Engine.Quaternion(global::Test Game Engine.Basis.Identity);
        values.Add(PropertyName.@_fieldQuaternion, global::Test Game Engine.Variant.From<global::Test Game Engine.Quaternion>(___fieldQuaternion_default_value));
        global::Test Game Engine.Transform3D ___fieldTransform3D_default_value = global::Test Game Engine.Transform3D.Identity;
        values.Add(PropertyName.@_fieldTransform3D, global::Test Game Engine.Variant.From<global::Test Game Engine.Transform3D>(___fieldTransform3D_default_value));
        global::Test Game Engine.Vector4 ___fieldVector4_default_value = new(10f, 10f, 10f, 10f);
        values.Add(PropertyName.@_fieldVector4, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector4>(___fieldVector4_default_value));
        global::Test Game Engine.Vector4I ___fieldVector4I_default_value = global::Test Game Engine.Vector4I.One;
        values.Add(PropertyName.@_fieldVector4I, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector4I>(___fieldVector4I_default_value));
        global::Test Game Engine.Projection ___fieldProjection_default_value = global::Test Game Engine.Projection.Identity;
        values.Add(PropertyName.@_fieldProjection, global::Test Game Engine.Variant.From<global::Test Game Engine.Projection>(___fieldProjection_default_value));
        global::Test Game Engine.Aabb ___fieldAabb_default_value = new global::Test Game Engine.Aabb(10f, 10f, 10f, new global::Test Game Engine.Vector3(1f, 1f, 1f));
        values.Add(PropertyName.@_fieldAabb, global::Test Game Engine.Variant.From<global::Test Game Engine.Aabb>(___fieldAabb_default_value));
        global::Test Game Engine.Color ___fieldColor_default_value = global::Test Game Engine.Colors.Aquamarine;
        values.Add(PropertyName.@_fieldColor, global::Test Game Engine.Variant.From<global::Test Game Engine.Color>(___fieldColor_default_value));
        global::Test Game Engine.Plane ___fieldPlane_default_value = global::Test Game Engine.Plane.PlaneXZ;
        values.Add(PropertyName.@_fieldPlane, global::Test Game Engine.Variant.From<global::Test Game Engine.Plane>(___fieldPlane_default_value));
        global::Test Game Engine.Callable ___fieldCallable_default_value = new global::Test Game Engine.Callable(global::Test Game Engine.Engine.GetMainLoop(), "_process");
        values.Add(PropertyName.@_fieldCallable, global::Test Game Engine.Variant.From<global::Test Game Engine.Callable>(___fieldCallable_default_value));
        global::Test Game Engine.Signal ___fieldSignal_default_value = new global::Test Game Engine.Signal(global::Test Game Engine.Engine.GetMainLoop(), "property_list_changed");
        values.Add(PropertyName.@_fieldSignal, global::Test Game Engine.Variant.From<global::Test Game Engine.Signal>(___fieldSignal_default_value));
        global::ExportedFields.MyEnum ___fieldEnum_default_value = global::ExportedFields.MyEnum.C;
        values.Add(PropertyName.@_fieldEnum, global::Test Game Engine.Variant.From<global::ExportedFields.MyEnum>(___fieldEnum_default_value));
        global::ExportedFields.MyFlagsEnum ___fieldFlagsEnum_default_value = global::ExportedFields.MyFlagsEnum.C;
        values.Add(PropertyName.@_fieldFlagsEnum, global::Test Game Engine.Variant.From<global::ExportedFields.MyFlagsEnum>(___fieldFlagsEnum_default_value));
        byte[] ___fieldByteArray_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@_fieldByteArray, global::Test Game Engine.Variant.From<byte[]>(___fieldByteArray_default_value));
        int[] ___fieldInt32Array_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@_fieldInt32Array, global::Test Game Engine.Variant.From<int[]>(___fieldInt32Array_default_value));
        long[] ___fieldInt64Array_default_value = { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@_fieldInt64Array, global::Test Game Engine.Variant.From<long[]>(___fieldInt64Array_default_value));
        float[] ___fieldSingleArray_default_value = { 0f, 1f, 2f, 3f, 4f, 5f, 6f  };
        values.Add(PropertyName.@_fieldSingleArray, global::Test Game Engine.Variant.From<float[]>(___fieldSingleArray_default_value));
        double[] ___fieldDoubleArray_default_value = { 0d, 1d, 2d, 3d, 4d, 5d, 6d  };
        values.Add(PropertyName.@_fieldDoubleArray, global::Test Game Engine.Variant.From<double[]>(___fieldDoubleArray_default_value));
        string[] ___fieldStringArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@_fieldStringArray, global::Test Game Engine.Variant.From<string[]>(___fieldStringArray_default_value));
        string[] ___fieldStringArrayEnum_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@_fieldStringArrayEnum, global::Test Game Engine.Variant.From<string[]>(___fieldStringArrayEnum_default_value));
        global::Test Game Engine.Vector2[] ___fieldVector2Array_default_value = { global::Test Game Engine.Vector2.Up, global::Test Game Engine.Vector2.Down, global::Test Game Engine.Vector2.Left, global::Test Game Engine.Vector2.Right   };
        values.Add(PropertyName.@_fieldVector2Array, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector2[]>(___fieldVector2Array_default_value));
        global::Test Game Engine.Vector3[] ___fieldVector3Array_default_value = { global::Test Game Engine.Vector3.Up, global::Test Game Engine.Vector3.Down, global::Test Game Engine.Vector3.Left, global::Test Game Engine.Vector3.Right   };
        values.Add(PropertyName.@_fieldVector3Array, global::Test Game Engine.Variant.From<global::Test Game Engine.Vector3[]>(___fieldVector3Array_default_value));
        global::Test Game Engine.Color[] ___fieldColorArray_default_value = { global::Test Game Engine.Colors.Aqua, global::Test Game Engine.Colors.Aquamarine, global::Test Game Engine.Colors.Azure, global::Test Game Engine.Colors.Beige   };
        values.Add(PropertyName.@_fieldColorArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Color[]>(___fieldColorArray_default_value));
        global::Test Game Engine.GodotObject[] ___fieldGodotObjectOrDerivedArray_default_value = { null  };
        values.Add(PropertyName.@_fieldGodotObjectOrDerivedArray, global::Test Game Engine.Variant.CreateFrom(___fieldGodotObjectOrDerivedArray_default_value));
        global::Test Game Engine.StringName[] ___fieldStringNameArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@_fieldStringNameArray, global::Test Game Engine.Variant.From<global::Test Game Engine.StringName[]>(___fieldStringNameArray_default_value));
        global::Test Game Engine.NodePath[] ___fieldNodePathArray_default_value = { "foo", "bar"  };
        values.Add(PropertyName.@_fieldNodePathArray, global::Test Game Engine.Variant.From<global::Test Game Engine.NodePath[]>(___fieldNodePathArray_default_value));
        global::Test Game Engine.Rid[] ___fieldRidArray_default_value = { default, default, default  };
        values.Add(PropertyName.@_fieldRidArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Rid[]>(___fieldRidArray_default_value));
        int[] ___fieldEmptyInt32Array_default_value = global::System.Array.Empty<int>();
        values.Add(PropertyName.@_fieldEmptyInt32Array, global::Test Game Engine.Variant.From<int[]>(___fieldEmptyInt32Array_default_value));
        int[] ___fieldArrayFromList_default_value = new global::System.Collections.Generic.List<int>(global::System.Array.Empty<int>()).ToArray();
        values.Add(PropertyName.@_fieldArrayFromList, global::Test Game Engine.Variant.From<int[]>(___fieldArrayFromList_default_value));
        global::Test Game Engine.Variant ___fieldVariant_default_value = "foo";
        values.Add(PropertyName.@_fieldVariant, global::Test Game Engine.Variant.From<global::Test Game Engine.Variant>(___fieldVariant_default_value));
        global::Test Game Engine.GodotObject ___fieldGodotObjectOrDerived_default_value = default;
        values.Add(PropertyName.@_fieldGodotObjectOrDerived, global::Test Game Engine.Variant.From<global::Test Game Engine.GodotObject>(___fieldGodotObjectOrDerived_default_value));
        global::Test Game Engine.Texture ___fieldGodotResourceTexture_default_value = default;
        values.Add(PropertyName.@_fieldGodotResourceTexture, global::Test Game Engine.Variant.From<global::Test Game Engine.Texture>(___fieldGodotResourceTexture_default_value));
        global::Test Game Engine.Texture ___fieldGodotResourceTextureWithInitializer_default_value = new()  { ResourceName  = ""   };
        values.Add(PropertyName.@_fieldGodotResourceTextureWithInitializer, global::Test Game Engine.Variant.From<global::Test Game Engine.Texture>(___fieldGodotResourceTextureWithInitializer_default_value));
        global::Test Game Engine.StringName ___fieldStringName_default_value = new global::Test Game Engine.StringName("foo");
        values.Add(PropertyName.@_fieldStringName, global::Test Game Engine.Variant.From<global::Test Game Engine.StringName>(___fieldStringName_default_value));
        global::Test Game Engine.NodePath ___fieldNodePath_default_value = new global::Test Game Engine.NodePath("foo");
        values.Add(PropertyName.@_fieldNodePath, global::Test Game Engine.Variant.From<global::Test Game Engine.NodePath>(___fieldNodePath_default_value));
        global::Test Game Engine.Rid ___fieldRid_default_value = default;
        values.Add(PropertyName.@_fieldRid, global::Test Game Engine.Variant.From<global::Test Game Engine.Rid>(___fieldRid_default_value));
        global::Test Game Engine.Collections.Dictionary ___fieldGodotDictionary_default_value = new()  { { "foo", 10  }, { global::Test Game Engine.Vector2.Up, global::Test Game Engine.Colors.Chocolate   }  };
        values.Add(PropertyName.@_fieldGodotDictionary, global::Test Game Engine.Variant.From<global::Test Game Engine.Collections.Dictionary>(___fieldGodotDictionary_default_value));
        global::Test Game Engine.Collections.Array ___fieldGodotArray_default_value = new()  { "foo", 10, global::Test Game Engine.Vector2.Up, global::Test Game Engine.Colors.Chocolate   };
        values.Add(PropertyName.@_fieldGodotArray, global::Test Game Engine.Variant.From<global::Test Game Engine.Collections.Array>(___fieldGodotArray_default_value));
        global::Test Game Engine.Collections.Dictionary<string, bool> ___fieldGodotGenericDictionary_default_value = new()  { { "foo", true  }, { "bar", false  }  };
        values.Add(PropertyName.@_fieldGodotGenericDictionary, global::Test Game Engine.Variant.CreateFrom(___fieldGodotGenericDictionary_default_value));
        global::Test Game Engine.Collections.Array<int> ___fieldGodotGenericArray_default_value = new()  { 0, 1, 2, 3, 4, 5, 6  };
        values.Add(PropertyName.@_fieldGodotGenericArray, global::Test Game Engine.Variant.CreateFrom(___fieldGodotGenericArray_default_value));
        long[] ___fieldEmptyInt64Array_default_value = global::System.Array.Empty<long>();
        values.Add(PropertyName.@_fieldEmptyInt64Array, global::Test Game Engine.Variant.From<long[]>(___fieldEmptyInt64Array_default_value));
        return values;
    }
#endif // TOOLS
#pragma warning restore CS0109
}
