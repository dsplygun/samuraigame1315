extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
<<<<<<< Updated upstream
	self.position.x = int($"../best_character".position.x / 576) * 576
	print(($"../best_character".position.x / 576))
=======
	var new_pos_x= int($"../best_character".position.x / 576) * 576
	var new_pos_y= int($"../best_character".position.y / 324) * 324
	if new_pos_x != self.position.x or new_pos_y !=self.position.y:
		var new_tween=create_tween()
		new_tween.tween_property(self,"position",Vector2(new_pos_x,new_pos_y),0.5)
		
>>>>>>> Stashed changes
