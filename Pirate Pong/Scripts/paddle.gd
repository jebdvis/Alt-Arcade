extends CharacterBody2D
class_name Paddle

enum PADDLE_CONTROLS {UPDOWN,LEFTRIGHT,BOT}
@export var controls:PADDLE_CONTROLS
@export var speed:float


func getInput():
	var inputVal
	match controls:
		PADDLE_CONTROLS.UPDOWN:
			inputVal = Input.get_axis("ui_up","ui_down")
		PADDLE_CONTROLS.LEFTRIGHT:
			inputVal = Input.get_axis("ui_left","ui_right")
		PADDLE_CONTROLS.BOT:
			if $"../Ball".global_position.y <= self.global_position.y:
				inputVal = -1.0
				if $"../Ball".global_position.x <self.global_position.x:
					inputVal = 1.0
			elif $"../Ball".global_position.y > self.global_position.y:
				inputVal = 1.0
				if $"../Ball".global_position.x <self.global_position.x:
					inputVal = -1.0
	velocity = Vector2(0,speed*inputVal)

func _physics_process(delta):
	getInput()
	move_and_slide()
