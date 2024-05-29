extends CharacterBody2D

@export var sprite : SpriteFrames 
var give_item = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.sprite_frames = sprite
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventKey:
		if $"../best_character" in $interact_area.get_overlapping_bodies():
			if Input.is_action_just_pressed("interact") and give_item == false:
				Inventory.add("npc_artifact")
				give_item = true
				Dialogic.start("res://dialogues/test_timelinr.dtl")
			elif Input.is_action_just_pressed("interact") and give_item == true:
				print("You're already have it!")

func _on_interact_area_body_entered(body):
	pass
