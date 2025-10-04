extends Node

var score = 0
@onready var haha_label: Label = %Haha_Label

func add_point():
	score += 1
	haha_label.text = " Haha: " + str(score)
