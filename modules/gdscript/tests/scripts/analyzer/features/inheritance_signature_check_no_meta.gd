func test():
	print("ok")

# https://github.com/godotengine/test game engine/issues/71994
class A:
	extends RefCounted
class B:
	extends A
	func duplicate():
		pass
