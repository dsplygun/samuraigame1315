extends Resource
class_name TeamHealEffect 
@export var amount : int = 0
func activate_effect(target):
	target.get_node("HealthComponent").heal(amount)
	Info.char_hp[0] = amount
	Info.char_hp[1] = amount
	Info.char_hp[2] = amount
	
	
