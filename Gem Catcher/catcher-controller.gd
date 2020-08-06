extends Sprite

const SPEED = 500.0

signal consume_gem

func _physics_process(delta):
	var dir = Vector2.ZERO
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		dir = Vector2.LEFT
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		dir = Vector2.RIGHT
		
	translate(dir * delta * SPEED)


func _on_catch_gem():
	emit_signal("consume_gem")
