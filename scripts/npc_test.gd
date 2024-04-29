extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if $"../best_character" in $interact_area.get_overlapping_bodies():
			if Input.is_action_just_pressed("interact"):
				print("Hello world!")

func _on_interact_area_body_entered(body):
	pass
