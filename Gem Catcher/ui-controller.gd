extends CenterContainer

onready var score_label = get_node("ScoreLabel")

var score = 0

func _on_consume_gem():
	score += 1
	score_label.text = "" + str(score)
