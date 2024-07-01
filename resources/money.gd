extends Resource
class_name AddMoney
@export var value: int
func activate_effect(target):
	Inventory.earn_gold(value)
	
	
