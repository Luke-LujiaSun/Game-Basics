extends SteppingRobot

var total_coin:int = 0
var coffee_num:int = 0

func turn_around():
	turn_left()
	turn_left()

func pick_one_coffee_and_turn_back_in_one_row():
	pick_up_item()
	turn_around()
	step_forward()
	drop_item()
	turn_around()
	step_forward()

func what_should_i_do():
	step_forward()
	for step in 5:
		print(coffee_num)
		if item_before_me:
			pick_one_coffee_and_turn_back_in_one_row()
			coffee_num += 1
			total_coin = coffee_num * 2
		else:
			turn_right()
			step_forward()
			turn_left()
	#if coffee_num >= 3:
		#total_coin += 2
