extends Spatial

const SPEED = 30.0

var dir = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		move_left(delta)
	elif Input.is_key_pressed(KEY_RIGHT):
		move_right(delta)
	else:
		dir = Vector3.ZERO

	translate(dir)

func move_left(delta):
	dir = Vector3.LEFT * delta * SPEED


func move_right(delta):
	dir = Vector3.RIGHT * delta * SPEED


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().reload_current_scene()
