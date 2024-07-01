extends Resource
class_name Dmg_buff 
#@export var value : Vector2 = Vector2(0,0)
#func activate_effect(target):
	#target.damage += value * 2
@export var effects = {"damageboost": 0}
@export var duration : int = 30
