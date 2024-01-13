extends Sprite2D

const INTRO = preload("res://Assets/Scenes/main.tscn")

@onready var title = $Title
@onready var game = $Game
@onready var ball = $Game/Ball
@onready var ball_timer = $Game/BallTimer
@onready var player_score = $Game/HUD/HBoxContainer/PlayerScore
@onready var cpu_score = $Game/HUD/HBoxContainer/CPUScore

var score := [0, 0]  # 0:Player, 1: CPU


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		# Start game
		title.visible = false
		game.visible = true
		ball_timer.start()
		ball.new_ball()
	
	if Input.is_action_just_pressed("ui_cancel"):
		# Quit game
		get_tree().change_scene_to_file("res://Assets/Scenes/main.tscn")


func _on_ball_timer_timeout():
	ball.new_ball()


func _on_score_left_body_entered(_body):
	score[1] += 1
	cpu_score.text = str(score[1])
	ball_timer.start()


func _on_score_right_body_entered(_body):
	score[0] += 1
	player_score.text = str(score[0])
	ball_timer.start()
