extends RigidBody2D

const SPEED = 200.0


func _physics_process(delta):
	var window_height = get_viewport_rect().size.y
	
#	move_and_collide(Vector2.DOWN * delta * SPEED)
	apply_impulse(Vector2.ZERO, Vector2.DOWN * delta * SPEED)
	
	if position.y > window_height:
		queue_free()
