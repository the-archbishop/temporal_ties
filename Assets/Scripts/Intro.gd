extends Control


@onready var computer_screen_off = $ComputerScreen_Off
@onready var weird_load_screen = $Loading


func _on_button_pressed():
	# TODO: Toggle light on monitor
	
	# Toggle screen on/off
	if computer_screen_off.visible == true:
		computer_screen_off.visible = false
	else:
		computer_screen_off.visible = true

	# TODO: Play some kind of loading animation
	await get_tree().create_timer(3.0).timeout
	weird_load_screen.visible = true
	await get_tree().create_timer(0.25).timeout
	
	# Switch to main scene	
	get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
