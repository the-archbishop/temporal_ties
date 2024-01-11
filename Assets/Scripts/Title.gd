extends Control

const INTRO = preload("res://Assets/Scenes/intro.tscn")


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		# Switch to main scene	
		get_tree().change_scene_to_file("res://Assets/Scenes/intro.tscn")
