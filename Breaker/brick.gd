extends RigidBody2D

var health: int

func _ready():
	health = 2


func _on_body_entered(body):
	if body.is_in_group("damager"):
		health -= 1
		
		if health == 1:
			modulate = Color.red
		
		if health <= 0:
			queue_free()
	elif body.is_in_group("player"):
		body.damage()
