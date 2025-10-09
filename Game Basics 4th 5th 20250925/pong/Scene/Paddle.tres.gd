extends StaticBody2D
var speed = 1000

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta

	position.x = clamp(position.x, -315, 315)
