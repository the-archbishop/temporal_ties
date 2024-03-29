extends Control


const InputResponse = preload("res://Assets/Scenes/input_response.tscn")
const Pong = preload("res://Assets/Scenes/pong.tscn")

@export var max_lines_remembered: int = 30 

@onready var command_processor = $CommandProcessor
@onready var history_rows = $GameContainer/MarginContainer/Rows/GameInformation/Scroll/HistoryRows
@onready var player_inner_dialog = "res://Assets/Resources/main.dtl"


func _ready():
	Dialogic.start(player_inner_dialog)


func _on_input_text_submitted(user_input):
	if user_input.is_empty():
		return
	
	var input_response = InputResponse.instantiate()
	var response = command_processor.process_command(user_input)
	if response == "clear":
		clear_screen()
	elif response == "pong":
		get_tree().change_scene_to_file("res://Assets/Scenes/pong.tscn")
	else:
		input_response.set_text(user_input, response)
		history_rows.add_child(input_response)
		del_history_beyond_max()


func del_history_beyond_max():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()


func clear_screen():
	var rows_to_clear = history_rows.get_child_count()
	for i in range(rows_to_clear):
			history_rows.get_child(i).queue_free()
