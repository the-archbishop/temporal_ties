extends StaticBody2D

var win_height : float
var p_height : float

const PADDLE_SPEED : int = 500


func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += PADDLE_SPEED * delta

	#limit paddle movement to window
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
