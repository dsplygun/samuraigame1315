extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	
	if $".".visible:
		$".".visible = false
	else:
		$".".visible = true
	get_tree().change_scene_to_file("res://Menu/menu.tscn"	)


func _on_music_value_changed(value):
	Settings.set_musicvolume(value)


func _on_sound_value_changed(value):
	Settings.set_soundvolume(value)


func _on_h_slider_value_changed(value):
	Settings.set_brightness(value)
