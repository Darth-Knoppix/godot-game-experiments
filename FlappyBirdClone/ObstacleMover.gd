extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_moving = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_moving:
		return
		
	if position.x < -100:
		queue_free()
		
	position.x -= delta * 400


func _on_stop_moving():
	is_moving = false
