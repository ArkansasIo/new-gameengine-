# https://github.com/godotengine/test game engine/issues/66675
func test():
	example(Node2D)

func example(thing):
	print(thing.has_method('asdf'))
