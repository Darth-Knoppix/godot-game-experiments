extends KinematicBody2D
signal player_died

var jump_speed = -400
var gravity = 900

var velocity = Vector2.ZERO
var jump_next = false
var is_alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.ZERO

func _input(event):
	if event.is_action_pressed("jump"):
		if not is_alive:
			get_tree().reload_current_scene()
			return
		print("space")
		jump_next = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not is_alive:
		return
	velocity.y += gravity * delta
	if jump_next:
		jump_next = false
		if velocity.y > 0:
			velocity.y = 0
		velocity.y += jump_speed
		velocity.y = max(velocity.y, -800)

	velocity = move_and_slide(velocity)


func _on_Collider_area_entered(area):
	emit_signal("player_died")
	is_alive = false
	velocity = Vector2.ZERO
	get_node("Sprite").stop()
	get_node("Explosion").emitting = true
	get_node("Sprite").hide()
