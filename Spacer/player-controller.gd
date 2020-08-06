extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var dir = Vector2.ZERO
	if Input.is_key_pressed(KEY_A):
		dir = Vector2.LEFT
	if Input.is_key_pressed(KEY_D):
		dir = Vector2.RIGHT
	
		
#	apply_impulse(Vector2.ZERO, dir * delta * 200)
#	translate(dir * delta * 200)
	apply_central_impulse(dir * delta * 200)
