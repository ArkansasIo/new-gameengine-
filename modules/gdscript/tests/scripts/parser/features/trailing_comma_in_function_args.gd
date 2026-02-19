# See https://github.com/godotengine/test game engine/issues/41066.

func f(p, ): ## <-- no errors
	print(p)

func test():
	f(0, ) ## <-- no error
