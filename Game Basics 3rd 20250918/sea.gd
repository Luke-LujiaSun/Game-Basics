extends Area2D

@export var slow_speed: float = 100.0

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.has_variable("current_speed") and body.has_variable("normal_speed"):
		body.current_speed = slow_speed

func _on_body_exited(body):
	if body.has_variable("current_speed") and body.has_variable("normal_speed"):
		body.current_speed = body.normal_speed
