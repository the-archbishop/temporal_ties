extends Control

const InputResponse = preload("res://Assets/Scenes/input_response.tscn")

@onready var history_rows = $ComputerScreen/GameContainer/MarginContainer/Rows/GameInformation/ScrollContainer/HistoryRows


func _on_input_text_submitted(user_input):
	var input_response = InputResponse.instantiate()
	input_response.set_text(user_input, "This is where the response would go.")
	history_rows.add_child(input_response)
