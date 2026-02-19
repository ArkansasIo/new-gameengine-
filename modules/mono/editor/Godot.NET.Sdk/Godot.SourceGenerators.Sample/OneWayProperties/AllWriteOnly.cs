using System;

namespace Test Game Engine.SourceGenerators.Sample
{
    public partial class AllWriteOnly : GodotObject
    {
        private bool _writeOnlyBackingField = false;
        public bool WriteOnlyProperty { set => _writeOnlyBackingField = value; }
    }
}
