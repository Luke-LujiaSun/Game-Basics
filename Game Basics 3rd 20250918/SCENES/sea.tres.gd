extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.speed = 40
	body.jump_velocity = -180.0
	body.animated_sprite_2d.set_animation("swim")
