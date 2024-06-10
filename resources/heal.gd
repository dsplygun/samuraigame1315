extends Resource
class_name HealEffect 
@export var value : int
func activate_effect(target):
	target.get_node("HealthComponent").heal(value)
	
	
