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
	return """This is a multi-line
		string in GDScript.
		You can use triple quotes
		to write text on multiple lines."""
	

func dir():
	return "NOTES	:	STAT"
