extends Node2D

var gem_square = preload("res://gem-square.tscn")
var gem_circle = preload("res://gem-circle.tscn")


func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.connect("timeout", self, "spawn_gem")
	timer.start()


func spawn_gem():
	var window_width = get_viewport_rect().size.x
	var spawn_pos = clamp(randf() * window_width, 10, window_width - 10)
	
	var choice = randi() % 2
	var gem_to_spawn: Resource
	
	if choice == 0:
		gem_to_spawn = gem_square
	elif choice == 1:
		gem_to_spawn = gem_circle
	
	var new_gem = gem_to_spawn.instance()
	new_gem.position = Vector2(spawn_pos, 0)
	add_child(new_gem)
