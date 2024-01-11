extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var continue_symbol = $TextboxContainer/MarginContainer/Continue
@onready var textbox_container = $TextboxContainer
@onready var dialog = $TextboxContainer/MarginContainer/HBoxContainer/Dialog

var end_of_dialog = false

func _ready():
	add_text("Alright, here it is – my very own computer!")


func hide_textbox():
	textbox_container.visible = false
	dialog.text = ""


func show_textbox():
	textbox_container.visible = true


func add_text(next_text):
	continue_symbol.visible = false
	show_textbox()
	dialog.text = next_text
	var tween = create_tween()
	tween.tween_property(dialog, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	tween.connect("finished", on_tween_finished)


func on_tween_finished():
	while true:
		_on_blink_timer_timeout()
		await get_tree().create_timer(2.0).timeout
		


func _on_blink_timer_timeout():
	# Toggle the visibility of the current node
	continue_symbol.visible = !continue_symbol.visible
