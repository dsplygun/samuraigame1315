extends Resource
class_name GiveBuff 
@export var buffs : Resource
func activate_effect(target):
	target.buff = (buffs)
	
	
