using System.Reflection;
using Microsoft.CodeAnalysis;

namespace Test Game Engine.SourceGenerators.Tests;

public static class Extensions
{
    public static MetadataReference CreateMetadataReference(this Assembly assembly)
    {
        return MetadataReference.CreateFromFile(assembly.Location);
    }
}
