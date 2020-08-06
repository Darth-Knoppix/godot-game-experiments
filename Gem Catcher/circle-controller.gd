extends KinematicBody2D

const SPEED = 2000.0

var time_delta = 0

func _physics_process(delta):
	time_delta += delta
	var window_height = get_viewport_rect().size.y
	
	move_and_slide(Vector2(sin(time_delta * 5.0) * delta * SPEED * 8.0, 4 * SPEED * delta), Vector2.UP)
	
	if position.y > window_height:
		queue_free()
