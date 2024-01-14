extends Node


func process_command(input: String):
	var words = input.split(" ", false)
	
	if words.size() == 0:
		print("Parsing error")
		return unknown()

	var command = words[0].to_lower()

	match command:
		"help":
			return help()
		_:
			return unknown()


func help():
	return """Help YOU? I think not."""


func unknown():
	var possible_responses = []
	return ""
