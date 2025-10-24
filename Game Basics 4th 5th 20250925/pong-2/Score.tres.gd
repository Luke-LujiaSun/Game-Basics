extends Control
@onready var score_label_p_1: Label = %score_label_p1
@onready var score_label_p_2: Label = %score_label_p2
@onready var label: Label = %label

func _ready() -> void:
	print(Global.score_p1)
	pass 

func _process(delta: float) -> void:
	pass
	
#Global for score tracking.
#Project>setting>globals
#add varibles that i don't want it to be affected by scene's reloading to the global scipt
func add_point_p1():
	Global.score_p1 += 1
	#cannot keep displayikng score without showing "0:0" on _ready
	# NEED TO BE FIXED
	score_label_p_1.text = str(Global.score_p1)
	score_label_p_2.text = str(Global.score_p2)
	label.text = ":"
	#print ("p1's score: " + str(Global.score_p1))

func add_point_p2():
	Global.score_p2 += 1
	score_label_p_1.text = str(Global.score_p1)
	score_label_p_2.text = str(Global.score_p2)
	label.text = ":"
	#print ("p2's score: " + str(Global.score_p2))
