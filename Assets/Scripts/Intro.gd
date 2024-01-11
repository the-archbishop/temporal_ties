extends Control


@onready var computer_screen_off = $ComputerScreen_Off
@onready var power_light_on = $ComputerLightOn
@onready var power_light_off = $ComputerLightOff
@onready var weird_load_screen = $Loading


func _ready():
	computer_screen_off.visible == true
	power_light_off.visible == true


func _on_button_pressed():
	# Toggle screen and power light on
	if computer_screen_off.visible == true:
		computer_screen_off.visible = false
		power_light_off.visible = false
		power_light_on.visible = true

	# Play some kind of loading animation
	await get_tree().create_timer(3.0).timeout
	weird_load_screen.visible = true
	await get_tree().create_timer(0.25).timeout
	
	# Switch to main scene	
	get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
