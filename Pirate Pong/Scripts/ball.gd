extends RigidBody2D
class_name Ball

@export var speed:float

signal pointScored(side)

var moveVector:Vector2

func _ready():
	$"../Timer".start()

func _physics_process(delta):
	if $"..".running:
		var collision = move_and_collide(speed * moveVector * delta)
		var newVector:Vector2 = moveVector
		if collision:
			if collision.get_collider() is CharacterBody2D:
				$"../AudioStreamPlayer3".play()
				var colPos = collision.get_position()
				var otherPos = collision.get_collider().get_position()
				newVector = Vector2(cos(deg_to_rad(30*(colPos[1]-otherPos[1])/60)),sin(deg_to_rad(65*(colPos[1]-otherPos[1])/60)))
				if position[0] > 540:
					newVector = Vector2(newVector[0]*-1,newVector[1])
			elif collision.get_collider() is TopWall:
				newVector = moveVector.bounce(collision.get_normal())
			else:
				$"../AudioStreamPlayer2".play()
				if collision.get_position().x < 960:
					pointScored.emit("left")
				else:
					pointScored.emit("right")
		moveVector = newVector	
