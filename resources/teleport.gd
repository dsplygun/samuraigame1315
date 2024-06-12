extends Resource
class_name TeleportEffect 
func activate_effect(target,value):
	target.position = value["teleport"]
	
