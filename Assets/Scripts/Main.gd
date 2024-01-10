extends Control


const InputResponse = preload("res://Assets/Scenes/input_response.tscn")

@export var max_lines_remembered: int = 30 

@onready var history_rows = $ComputerScreen/GameContainer/MarginContainer/Rows/GameInformation/Scroll/HistoryRows


func _on_input_text_submitted(user_input):
	if user_input.is_empty():
		return
	
	var input_response = InputResponse.instantiate()
	input_response.set_text(user_input, "This is where the response would go.")
	history_rows.add_child(input_response)

	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()
