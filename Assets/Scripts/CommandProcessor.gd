extends Node


func process_command(input: String):
	var words = input.split(" ", false)
	
	if words.size() == 0:
		print("Parsing error")
		return error()

	var command = words[0].to_lower()
	match command:
		"stat":
			return stat()
		"help":
			return help()
		"dir":
			return dir()
		"clr":
			return clr()
		_:
			return error()


func stat():
	return "RW, Free Space:     20k"


func help():
	return """Welcome to your cutting-edge personal computing experience! This helpfile provides essential information to help you navigate your EONLink Personal Computer.
		
		SETTINGS
		Customize your computing experience.
		
		STAT
		Display the current state of your personal computer.
		
		DIR
		Displays the (non-system) files and programs in the disk directory.
				
		CLR
		Clears the command/response history on the screen."""
	

func dir():
	return """NOTES     :
		"""


func clr():
	return "clear"


func error():
	return "ERROR: Unable to parse"
