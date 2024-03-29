extends Control

const MAIN = preload("res://Assets/Scenes/main.tscn")

@onready var computer_screen_off = $ComputerScreen_Off
@onready var power_light_on = $ComputerLightOn
@onready var power_light_off = $ComputerLightOff
@onready var weird_load_screen = $Loading
@onready var message = $GameContainer/MarginContainer/Rows/GameInformation/HistoryRows/Message
@onready var message2 = $GameContainer/MarginContainer/Rows/GameInformation/HistoryRows/Message2
@onready var message3 = $GameContainer/MarginContainer/Rows/GameInformation/HistoryRows/Message3
@onready var player_internal_dialog = "res://Assets/Resources/intro.dtl"

var mem_loaded = ["00064", "00128", "00192", "00256", "00320", "00384", "00448", "00512", "00576", "00640"]
var current_time = Time.get_time_string_from_system()
var current_date = Time.get_date_dict_from_system()
var month = current_date.month
var day = current_date.day


func _ready():
	computer_screen_off.visible = true
	power_light_off.visible = true
	
	Dialogic.start(player_internal_dialog)


func _on_button_pressed():
	# Toggle screen and power light on
	if computer_screen_off.visible == true:
		computer_screen_off.visible = false
		power_light_off.visible = false
		power_light_on.visible = true

	# Loading animation
	for memory in mem_loaded:
		message.text = memory + " KB OK"
		var rand_load_time = randf() * 0.5 + 0.15
		await get_tree().create_timer(rand_load_time).timeout
	await get_tree().create_timer(1.5).timeout
	message.text = "Current date is  " + str(month) + "/" + str(day) + "/1984"
	message2.text = "Current time is  " + Time.get_time_string_from_system()
	message3.text = """EONLink Personal Computer
					Version 3.14 
					(C)Copyright EONLink Services 1981"""
	await get_tree().create_timer(5.0).timeout
	message.text = ""
	message2.text = ""
	message3.text = ""
	weird_load_screen.visible = true
	await get_tree().create_timer(0.25).timeout
	
	# Switch to main scene	
	get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")
