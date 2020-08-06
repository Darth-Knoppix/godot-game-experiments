extends Area2D

var last_hit: Node
var timer: Timer

signal consume_gem

func _ready():
	connect("body_entered", self, "_on_enter")


func _on_consume_gem():
	if last_hit:
		emit_signal("consume_gem")
		last_hit.queue_free()
		timer.stop()
		timer.queue_free()


func _on_enter(body):
	last_hit = body
	timer = Timer.new()
	timer.wait_time = 0.1
	add_child(timer)
	timer.connect("timeout", self, "_on_consume_gem")
	timer.start()
