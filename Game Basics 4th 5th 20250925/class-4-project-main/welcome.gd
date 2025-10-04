@warning_ignore("missing_tool")
extends SteppingRobot

#var money : int = 10
#var coffee_price: int = 2

func what_should_i_do() -> void:
	#for step in 6:
		#tep_forward()
	while is_item_before_me == false:
		step_forward()

#func calculate_cost_of_coffee(number_of_cups : int) -> int:
	#var total_cost : int = number_of_cups * coffee_price
	#if number_of_cups > 2:
	#	total_cost -= 1
	#print(total_cost)
	#return total_cost
