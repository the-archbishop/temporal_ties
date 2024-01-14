extends Control

const INTRO = preload("res://Assets/Scenes/intro.tscn")


func _on_start_pressed():
	# Switch to main scene	
	get_tree().change_scene_to_file("res://Assets/Scenes/intro.tscn")
