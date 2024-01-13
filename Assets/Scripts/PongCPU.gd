extends StaticBody2D

var ball_pos : Vector2
var dist : float
var move_by : float
var win_height : float
var p_height : float

const PADDLE_SPEED : int = 500


func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	#move paddle towards ball
	ball_pos = $"../Ball".position
	dist = position.y - ball_pos.y
	
	if abs(dist) > PADDLE_SPEED * delta:
		move_by = PADDLE_SPEED * delta * (dist / abs(dist))
	else:
		move_by = dist

	position.y -= move_by
	
	#limit paddle movement to window
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
