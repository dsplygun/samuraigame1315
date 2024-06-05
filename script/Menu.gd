extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/forest.tscn"	)



func _on_exti_pressed():
	get_tree().quit()


func _on_seting_pressed():
	
		if $"start".visible:
			$"start".visible = false
		else:
			$"start".visible = true
		if $"exti".visible:
			$"exti".visible = false
		else:
			$"exti".visible = true
		if $"seting".visible:
			$"seting".visible = false
		else:
			$"seting".visible = true
		get_tree().change_scene_to_file("res://Menu/seting.tscn")
