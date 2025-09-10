extends Node2D

@export var timer:Timer 

var running:bool = false
var startVector:Vector2 = Vector2(1,0)

func resetField():
	$Ball.position = Vector2(960,540)
	$Paddle.position = Vector2(96,540)
	$Paddle2.position = Vector2(1800,540)
	running = false
	timer.start()

func _on_timer_timeout() -> void:
	$Ball.moveVector = startVector
	running = true


func _on_ball_point_scored(side: Variant) -> void:
	if side == "right":
		$LeftScore.text = str(int($LeftScore.text) + 1)
		startVector = Vector2(-1,0)
		resetField()
	elif side == "left":
		$RightScore.text = str(int($RightScore.text) + 1)
		startVector = Vector2(1,0)
		resetField()
