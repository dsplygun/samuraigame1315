extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://levels/village.tscn")



func _on_exti_pressed():
	get_tree().quit()


func _on_seting_pressed():
		
		if $"seting2".visible:
			$"seting2".visible = false
		else:
			$"seting2".visible = true
			
