# https://github.com/godotengine/test game engine/issues/54589
# https://github.com/godotengine/test game engine/issues/56265

extends Resource

func test():
	print("okay")
	await self.changed
	await unknown(self)

func unknown(arg):
	await arg.changed
