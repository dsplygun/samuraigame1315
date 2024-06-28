extends Resource
class_name TeleportEffect 
@export var place : Vector2 = Vector2(0,0)
func activate_effect(target):
	target.position = place / 2
	
