extends Resource
class_name AddItem
@export var item : String
func activate_effect(target):
	Inventory.add(item)
	print(123)
	
