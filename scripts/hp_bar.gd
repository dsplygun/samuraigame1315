extends ProgressBar
@export var chararam : int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = $"../../HealthComponent".max_health
	value = $"/root/Info".char_hp[chararam]
