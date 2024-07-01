extends Area2D

func _on_body_entered(body):
	if body.is_in_group("hero"):
		get_tree().change_scene_to_file("res://levels/Menu/menu.tscn")
