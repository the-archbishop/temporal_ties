extends Control

const INNER_DIALOG_BOX = preload("res://Assets/Scenes/inner_dialog_box.tscn")

@onready var computer_screen_off = $ComputerScreen_Off
@onready var power_light_on = $ComputerLightOn
@onready var power_light_off = $ComputerLightOff
@onready var weird_load_screen = $Loading


func _ready():
	computer_screen_off.visible = true
	power_light_off.visible = true
	
	await get_tree().create_timer(1.0).timeout
	var dialog_box  = INNER_DIALOG_BOX.instantiate()
	get_parent().add_child(dialog_box)
	dialog_box.queue_text("Alright! Here it is - my very own computer!")
	dialog_box.queue_text("Well, sort of... The boss finally let me to take one home. I really can't believe I have a computer sitting right here on my kitchen table! It's like stepping into the future.")
	dialog_box.queue_text("Okay, deep breath. Let's fire this baby up!")
	dialog_box.display_text()

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
