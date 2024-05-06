extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resum_pressed():
	visible = false


func _on_seting_pressed():
	
		if $"../seting".visible:
			$"../seting".visible = false
		else:
			$"../seting".visible = true
			



func _on_v_menu_2_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
