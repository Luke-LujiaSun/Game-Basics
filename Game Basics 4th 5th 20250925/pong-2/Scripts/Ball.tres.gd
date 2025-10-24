extends CharacterBody2D

var speed_ball : int = 800
var direction_modifier : Vector2 = Vector2(1,1)
#random angle
var vector_random_y : Array = [1.0, -1.0]
var random_choice_y = vector_random_y.pick_random()
# make sure wont go in 90degree
#EASIER WAY?
var vector_random_x : Array = [-0.55, 0.55]
var random_choice_x = vector_random_x.pick_random()
var vector_random_x2 : Vector2 = Vector2(random_choice_x,0)
var vector_random : Vector2 =  (vector_random_x2 + Vector2(randf_range(-0.15, 0.15), random_choice_y)).normalized()
#score
@onready var score: Control = %Score
#se
@onready var se_ball: AudioStreamPlayer2D = $se_ball
@onready var se_wall: AudioStreamPlayer2D = $se_wall
@onready var se_score: AudioStreamPlayer2D = $se_score

@onready var paddle: CharacterBody2D = $"."


func _ready() -> void:
	pass

func _process(delta: float):
	velocity = vector_random * speed_ball * direction_modifier
	#print(velocity)
	move_and_slide()

#to detect ball bounce, by using the area2d siganal and see if area2d is collide with body2d(boundary and paddle)
#i need to add a area2d in this case, can i use a simplier way?
func _on_area_2d_body_entered(body: Node2D):
	# to prevent ball(static2d or other) pushing my paddle(charater2d),
	# i add another static2d to collide with ball in ball's node
	if body.name == "paddle_collision_ball": 
		#need to futther anylysize 
		#why there is but writing: direction_modifier = Vector2(-1,-1) * direction_modifier
		direction_modifier *= Vector2(1,-1)
		#print("yes")
		#faster
		#speed_ball *= 1.05
		#se
		se_ball.play()
#THERE ARE BUG WHEN WRITING THEM TOGETHER WITH "OR"
	if body.name == "boundary_left":
		#need to futther anylysize
		direction_modifier *= Vector2(-1,1)
		#print("wow" + str(velocity))
		se_wall.play()
	if body.name == "boundary_right":
		#need to futther anylysize
		direction_modifier *= Vector2(-1,1)
		#print("wow" + str(velocity))
		se_wall.play()

	#score
	#have to use this area signal, node signal does not work in this case
	#because it is an area
func _on_ball_bounce_detect_area_entered(area: Area2D) -> void:
	if area.name == "respawn_area_down":
		#print("touch1")
		score.add_point_p1()
		se_score.play()
	if area.name == "respawn_area_up":
		#print("touch2")
		score.add_point_p2()
		se_score.play()
