using System.Threading.Tasks;
using Xunit;

namespace Test Game Engine.SourceGenerators.Tests;

public class ScriptSerializationGeneratorTests
{
    [Fact]
    public async Task ScriptBoilerplate()
    {
        await CSharpSourceGeneratorVerifier<ScriptSerializationGenerator>.VerifyNoCompilerDiagnostics(
            "ScriptBoilerplate.cs",
            "ScriptBoilerplate_ScriptSerialization.generated.cs", "OuterClass.NestedClass_ScriptSerialization.generated.cs"
        );
    }
}
