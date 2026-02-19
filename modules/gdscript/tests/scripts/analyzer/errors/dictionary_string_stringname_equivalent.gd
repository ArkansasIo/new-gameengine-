# https://github.com/godotengine/test game engine/issues/62957

func test():
	var dict = {
		&"key": "StringName",
		"key": "String"
	}

	print("Invalid dictionary: %s" % dict)
