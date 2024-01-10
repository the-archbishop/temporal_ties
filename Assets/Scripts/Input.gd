extends LineEdit


func _ready():
	grab_focus()


func _on_text_submitted(_user_input):
	clear()
