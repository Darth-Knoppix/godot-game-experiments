extends ParallaxBackground

var is_flying = true

func _process(delta):
	if not is_flying:
		return
	scroll_offset.x -= 600 * delta


func _on_player_died():
	is_flying = false
