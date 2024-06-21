extends StaticBody2D
@export var effect : Resource
#@export var value : Array[Variant]
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("interact"):
			for body in $interact_area.get_overlapping_bodies():
				if body.is_in_group("hero"):
					effect.activate_effect(body)
					
					

func _on_interact_area_body_entered(body):
	pass
