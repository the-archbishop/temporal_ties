extends Node


func process_command(input: String):
	var words = input.split(" ", false)
	
	if words.size() == 0:
		print("Parsing error")
		return error()

	var command = words[0].to_lower()
	var command2 = ""
	if words.size() > 1:
		command2 = words[1].to_lower()

	match command:
		"stat":
			return stat()
		"help":
			return help()
		"dir":
			return dir()
		"clr":
			return clr()
		"tod":
			return tod()
		"ed", "pd", "diskutil", "sys":
			return abort()
		"pong":
			return pong()
		"user":
			return user()
		"cd":
			return cd(command2)
		_:
			return error()


func stat():
	return "RW, Free Space:     20k"


func help():
	return """Welcome to the future of personal computing with EONLink!
		
		DIR
		Displays the files and programs in the disk directory.
		
		CD <DIR NAME>
		Navigate into sub-folders.

		CLR
		Clears the command/response history on the screen."""
	

func dir():
	return """HELP     CMD : STAT     CMD
		TOD      CMD : ED       CMD
		PD       CMD : SYS      CMD
		PONG     EXE : DISKUTL  CMD
		USER     CMD : ARCHCOMM DIR
		"""


func clr():
	return "clear"
	

func tod():
	var current_time = Time.get_time_string_from_system()
	var current_date = Time.get_date_dict_from_system()
	var month = current_date.month
	var day = current_date.day
	var datetime = str(month) + "/" + str(day) + "/1984     " + current_time
	return datetime


func abort():
	return "Process Aborted. Insert diskette."
	

func pong():
	return "pong"


func user():
	return "Currently logged in as user 0"


func cd(dir_name):
	if dir_name == "archcomm":
		return "You found the secret directory!"
	else:
		return "ERROR: Directory not found"


func error():
	return "ERROR: Unable to parse"
