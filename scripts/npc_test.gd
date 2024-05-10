extends CharacterBody2D

var give_item = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if $"../best_character" in $interact_area.get_overlapping_bodies():
			if Input.is_action_just_pressed("interact") and give_item == false:
				print("Here, take it!")
				Inventory.add("npc_artifact")
				give_item = true
			elif Input.is_action_just_pressed("interact") and give_item == true:
				print("You're already have it!")

func _on_interact_area_body_entered(body):
	pass
