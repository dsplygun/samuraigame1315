extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = $"../../best_character/HealthComponent".max_health
	value = $"../../best_character/HealthComponent".health
