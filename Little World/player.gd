extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000

var velocity = Vector2.ZERO
var is_jumping = false
var planets: Array
var current_planet: Node
var time_delta = 0


func _ready():
	planets = get_node("/root/MainLevel/Planets").get_children()
	current_planet = planets[0]
	_get_closest_planet(current_planet)
	_start_closest_planet_timer()


func get_input():
	velocity.x = 0
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("walk_left"):
		velocity.x -= speed
		$AnimatedSprite.play()
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.playing = false


func _physics_process(delta):
	get_input()
	
	time_delta += delta

	var gravity_dir = current_planet.global_transform.origin - global_transform.origin
	rotation = gravity_dir.angle() - PI/2
	
	velocity.y += gravity * delta
	var snap = transform.y * 128 if !is_jumping else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity.rotated(rotation), snap, -transform.y, true, 2, PI/3)
	velocity = velocity.rotated(-rotation)

	if is_on_floor():
		is_jumping = false
		if Input.is_action_just_pressed("jump"):
			is_jumping = true
			velocity.y = jump_speed


func _get_closest_planet(smallest):
	var new_smallest = smallest
	var did_change = false
	
	if !is_jumping:
		return
	
	for planet in planets:
		if !new_smallest:
			new_smallest = planet

		if global_position.distance_to(planet.global_position) < global_position.distance_to(new_smallest.global_position):
			new_smallest = planet

	if new_smallest != current_planet:
		is_jumping = false
		velocity.y = 1200
		
	current_planet = new_smallest


func _start_closest_planet_timer():
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.connect("timeout", self, "_get_closest_planet", [current_planet])
	add_child(timer)
	timer.start()
	
