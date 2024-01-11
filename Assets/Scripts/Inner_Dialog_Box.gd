extends CanvasLayer

@onready var continue_symbol = $TextboxContainer/MarginContainer/Continue
@onready var textbox_container = $TextboxContainer
@onready var dialog = $TextboxContainer/MarginContainer/HBoxContainer/Dialog

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

var tween


func _ready():
	print("Starting state: State.READY")


func _process(_delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				tween.kill()
				dialog.visible_ratio = 1.0
				on_tween_finished()
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
				hide_textbox()


func queue_text(next_text):
	text_queue.push_back(next_text)


func hide_textbox():
	textbox_container.visible = false
	dialog.text = ""


func show_textbox():
	textbox_container.visible = true


func display_text():
	# Abort previous animation
	if tween:
		dialog.visible_ratio = 0.0
		tween.kill()  # Abort previous animation
	
	# Get next dialog and display it
	var next_text = text_queue.pop_front()
	change_state(State.READING)
	continue_symbol.visible = false
	show_textbox()
	dialog.text = next_text
	tween = create_tween()
	tween.tween_property(dialog, "visible_ratio", 1.0, len(next_text) * 0.05)
	tween.connect("finished", on_tween_finished)


func on_tween_finished():
	change_state(State.FINISHED)
	while true:
		_on_blink_timer_timeout()
		await get_tree().create_timer(2.0).timeout


func _on_blink_timer_timeout():
	# Toggle the visibility of the current node
	continue_symbol.visible = !continue_symbol.visible


func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")
