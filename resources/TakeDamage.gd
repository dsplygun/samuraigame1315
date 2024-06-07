extends Resource
class_name DamageEffect 
@export var value : int
func activate_effect(target):
	target.get_node("HealthComponent").take_damage(value)
