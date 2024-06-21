extends Resource
class_name HealEffect 
@export var amount : int = 0
func activate_effect(target):
	target.get_node("HealthComponent").heal(amount)
	
	
