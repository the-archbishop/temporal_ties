extends Control

@export var max_lines_remembered: int = 30 

const INPUTRESPONSE = preload("res://Assets/Scenes/input_response.tscn")
const DIALOGROW = preload("res://Assets/Scenes/dialogue_row.tscn")
const INNER_DIALOG_BOX = preload("res://Assets/Scenes/inner_dialog_box.tscn")

@onready var archcomm = $"."
@onready var archcomm_processor = $ArchComProcessor
@onready var history_rows = $GameContainer/MarginContainer/Rows/GameInformation/Scroll/HistoryRows



func _ready():
	var dialog_row = DIALOGROW.instantiate()
	var dialog_box  = INNER_DIALOG_BOX.instantiate()
	
	dialog_row.text = """

 ▄▄▄       ██▀███   ▄████▄   ██░ ██  ▄▄▄       ██▓ ▄████▄                                                    
▒████▄    ▓██ ▒ ██▒▒██▀ ▀█  ▓██░ ██▒▒████▄    ▓██▒▒██▀ ▀█                                                    
▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄ ▒██▀▀██░▒██  ▀█▄  ▒██▒▒▓█    ▄                                                   
░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒░▓█ ░██ ░██▄▄▄▄██ ░██░▒▓▓▄ ▄██▒                                                  
 ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓ ▓█   ▓██▒░██░▒ ▓███▀ ░                                                  
 ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░▓  ░ ░▒ ▒  ░                                                  
  ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░  ▒   ▒▒ ░ ▒ ░  ░  ▒                                                     
  ░   ▒     ░░   ░ ░         ░  ░░ ░  ░   ▒    ▒ ░░                                                          
	  ░  ░   ░     ░ ░       ░  ░  ░      ░  ░ ░  ░ ░                                                        
				   ░                              ░                                                          
 ▄████▄   ▒█████   ███▄ ▄███▓ ███▄ ▄███▓ █    ██  ███▄    █  ██▓ ▄████▄   ▄▄▄     ▄▄▄█████▓ ▒█████   ██▀███  
▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▀█▀ ██▒ ██  ▓██▒ ██ ▀█   █ ▓██▒▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒
▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▓██    ▓██░▓██  ▒██░▓██  ▀█ ██▒▒██▒▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒
▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒██    ▒██ ▓▓█  ░██░▓██▒  ▐▌██▒░██░▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄  
▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒▒██▒   ░██▒▒▒█████▓ ▒██░   ▓██░░██░▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒
░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒ ░▓  ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░
  ░  ▒     ░ ▒ ▒░ ░  ░      ░░  ░      ░░░▒░ ░ ░ ░ ░░   ░ ▒░ ▒ ░  ░  ▒     ▒   ▒▒ ░   ░      ░ ▒ ▒░   ░▒ ░ ▒░
░        ░ ░ ░ ▒  ░      ░   ░      ░    ░░░ ░ ░    ░   ░ ░  ▒ ░░          ░   ▒    ░      ░ ░ ░ ▒    ░░   ░ 
░ ░          ░ ░         ░          ░      ░              ░  ░  ░ ░            ░  ░            ░ ░     ░     
░                                                               ░                                            

"""
	dialog_row.add_theme_font_size_override("font_size", 4)
	history_rows.add_child(dialog_row)
	archcomm.add_child(dialog_box)
	dialog_box.queue_text("...Archaic Communicator? I don't remember seeing this in the manual. Maybe I should try the 'help' command again.")


func _on_input_text_submitted(user_input):
	var response = archcomm_processor.process_command(user_input)
	var input_response = INPUTRESPONSE.instantiate()
	input_response.set_text(user_input, response)
	history_rows.add_child(input_response)
	del_history_beyond_max()


func add_dialogue_history():
	pass


func del_history_beyond_max():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()
