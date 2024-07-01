extends Resource
class_name SpeedBoost
@export var value : int = 0
func activate_effect(target):
	target.speed += value
	#get_node("rune_active").visible = true
