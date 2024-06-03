extends Node
var soundvolume : float = 1
var musicvolume : float = 1
var brightness : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_soundvolume(new_volume:float):
	soundvolume = new_volume
	SoundManager.set_sound_volume(new_volume)
	
func set_musicvolume(new_volume:float):
	musicvolume = new_volume
	SoundManager.set_music_volume(new_volume)
	
func set_brightness(new_brightness:float):
	brightness = new_brightness
	
	

