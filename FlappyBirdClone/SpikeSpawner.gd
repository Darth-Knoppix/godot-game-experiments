extends Node2D

export(PackedScene) var template

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	var obj = template.instance()
	obj.position.x = 1100
	obj.position.y = rand_range(-100, 100)
	add_child(obj)


func _on_player_died():
	get_node("Timer").stop()
	for child in get_children():
		if child.name == "Timer":
			continue
		child.is_moving = false
