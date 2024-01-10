extends LineEdit


func _ready():
	grab_focus()


func _on_text_submitted(user_input):
	clear()
