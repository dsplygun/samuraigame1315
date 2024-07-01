extends Resource
class_name Nightstone
@export var value : int
func activate_effect(target):
	target.get_node("intr/_night_").visible=true
