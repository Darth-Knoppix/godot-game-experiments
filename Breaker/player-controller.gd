extends KinematicBody2D

var move_speed = 200
var power = 10
export (NodePath) var patrol_path
export (int) var patrol_index = 0
var patrol_points
var vel: Vector2

func _ready():
	if patrol_path:
		patrol_points = get_node(patrol_path).curve.get_baked_points()
		var target = patrol_points[patrol_index]
		global_position = target
		
	


func _process(delta):
	if Input.is_key_pressed(KEY_S):
		$Affector.space_override = Area2D.SPACE_OVERRIDE_COMBINE_REPLACE
		$Affector.gravity_vec = $Affector.global_position.direction_to(global_position) * power
	elif Input.is_key_pressed(KEY_W):
		$Affector.space_override = Area2D.SPACE_OVERRIDE_COMBINE_REPLACE
		$Affector.gravity_vec = global_position.direction_to($Affector.global_position) * power
	else:
		$Affector.space_override = Area2D.SPACE_OVERRIDE_DISABLED
	

func _physics_process(delta):
	_move()


func _move():
	if !patrol_path:
		return
	
	var target = patrol_points[patrol_index]
	
	if position.distance_to(target) < (move_speed / 100):
		if Input.is_key_pressed(KEY_A) and patrol_index > 0:
			patrol_index -= 1
	
		if Input.is_key_pressed(KEY_D) and patrol_index < patrol_points.size() - 1:
			patrol_index += 1
	
	target = patrol_points[patrol_index]
	vel = (target - position).normalized() * move_speed
	
	var last_angle = global_position.angle()
	
	if Input.is_key_pressed(KEY_A):
		var next_rot = global_position - vel
		var next_angle = next_rot.angle()
		
		move_and_slide(vel)
		if abs(next_angle - last_angle) <= 1:
			look_at(next_rot)
	if Input.is_key_pressed(KEY_D):
		var next_rot = global_position + vel
		var next_angle = next_rot.angle()
		
		move_and_slide(vel)
		if abs(next_angle - last_angle) <= 1:
			look_at(next_rot)

func damage():
	$Triangle.modulate = Color.blue
