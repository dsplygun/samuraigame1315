extends Node

@export var track : AudioStream
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_music(track)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not SoundManager.is_music_playing():
		SoundManager.play_music(track)
