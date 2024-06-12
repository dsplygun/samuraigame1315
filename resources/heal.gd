extends Resource
class_name HealEffect 
func activate_effect(target,value):
	target.get_node("HealthComponent").heal(value["heal"])
	
	
