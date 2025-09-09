extends CharacterBody2D
class_name Ball

@export var speed:float
var oldVel:Vector2

func _ready():
	velocity = Vector2(1,0) * speed

func _physics_process(delta):
	var newVelocity = velocity
	if self.get_slide_collision_count() > 0:
		var collision = self.get_slide_collision(0)
		if collision.get_collider() is CharacterBody2D:
			var colPos = collision.get_position()
			var otherPos = collision.get_collider().get_position()
			newVelocity = speed * Vector2(cos(deg_to_rad(65*(colPos[1]-otherPos[1])/60)),sin(deg_to_rad(65*(colPos[1]-otherPos[1])/60)))
			if position[0] > 540:
				newVelocity = Vector2(newVelocity[0]*-1,newVelocity[1])
		elif collision.get_collider() is TopWall:
			newVelocity = oldVel.bounce(collision.get_normal())
	oldVel = velocity
	velocity = newVelocity
	move_and_slide()
	
