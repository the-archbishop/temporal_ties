extends VBoxContainer


func set_text(input: String, response: String):
	$InputHistory.text = "A> " + input
	$Response.text = response
