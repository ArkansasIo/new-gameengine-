using Test Game Engine;

public abstract partial class AbstractGenericNode<[MustBeVariant] T> : Node
{
    [Export] // This should be included, but without type hints.
    public Test Game Engine.Collections.Array<T> MyArray { get; set; } = new();
}
