extends CanvasLayer

@export var dialogue_json: JSON

@onready var state = {}
@onready var choice_button = preload("res://Assets/Scenes/dialog_choice.tscn")
@onready var narration = $TextboxContainer/MarginContainer/VBoxContainer/Narration
@onready var dialogue_container = $TextboxContainer/MarginContainer/VBoxContainer

var choice_buttons: Array[Button] = []


func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)


func clear_dialogue():
	narration.text = ""
	for choice in choice_buttons:
		dialogue_container.remove_child(choice)
	choice_buttons

func add_narration(text: String):
	narration.text = text


func add_choice(text: String):
	var button_node = choice_button.instantiate()
	button_node.choice_index = choice_buttons.size()
	button_node.text = text
	choice_buttons.push_back(button_node)
	
	button_node.choice_selected.connect(_on_choice_selected)
	dialogue_container.add_child(button_node)


func _on_choice_selected(choice_index: int):
	($EzDialogue as EzDialogue).next(choice_index)
	clear_dialogue()


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	add_narration(response.text)
	for choice in response.choices:
		add_choice(choice)
