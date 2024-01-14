extends Control


const InputResponse = preload("res://Assets/Scenes/input_response.tscn")

@export var max_lines_remembered: int = 30 
@onready var history_rows = $GameContainer/MarginContainer/Rows/GameInformation/Scroll/HistoryRows


func del_history_beyond_max():
	if history_rows.get_child_count() > max_lines_remembered:
		var rows_to_forget = history_rows.get_child_count() - max_lines_remembered
		for i in range(rows_to_forget):
			history_rows.get_child(i).queue_free()
