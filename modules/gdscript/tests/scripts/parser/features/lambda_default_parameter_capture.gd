# https://github.com/godotengine/test game engine/issues/56751

func test():
	var x = "local"
	var lambda = func(param = x):
		print(param)
	lambda.call()
