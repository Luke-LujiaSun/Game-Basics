extends SteppingRobot


func what_should_i_do():
#	for i in 4:
#		for step in 4:
#			step_forward()
#		turn_right()
	for i in 4:
		while not item_before_me:
			step_forward()
		turn_right()
