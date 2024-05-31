extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x = int($"../best_character".position.x / 576) * 576
	self.position.y = int($"../best_character".position.y / 324) * 324
	print(($"../best_character".position.x / 576))
