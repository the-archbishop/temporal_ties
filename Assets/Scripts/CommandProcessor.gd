extends Node


func process_command(input: String):
	var words = input.split(" ", false)
	
	if words.size() == 0:
		print("Parsing error")
		return "ERROR: Unable to parse"

	var command = words[0].to_lower()
	match command:
		"help":
			return help()
		"dir":
			return dir()


func help():
	return """Lorem ipsum dolor sit amet,
		consectetur adipiscing elit,
		sed do eiusmod tempor
		incididunt ut labore et dolore."""
	

func dir():
	return """NOTES     :
		"""
