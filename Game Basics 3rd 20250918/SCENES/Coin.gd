extends Area2D

@onready var score: Node = %Score
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	score.add_point()
	animation_player.play("new_animation")
	pass # Replace with function body.
