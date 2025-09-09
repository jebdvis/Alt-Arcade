extends CharacterBody2D
class_name Paddle

enum PADDLE_CONTROLS {UPDOWN,LEFTRIGHT}
@export var controls:PADDLE_CONTROLS
@export var speed:float


func getInput():
	var inputVal
	match controls:
		PADDLE_CONTROLS.UPDOWN:
			inputVal = Input.get_axis("ui_up","ui_down")
		PADDLE_CONTROLS.LEFTRIGHT:
			inputVal = Input.get_axis("ui_left","ui_right")
	velocity = Vector2(0,speed*inputVal)

func _physics_process(delta):
	getInput()
	move_and_slide()
