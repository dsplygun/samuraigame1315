extends CharacterBody2D

@onready var char_anim = get_node("AnimatedSprite2D")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var direction = Vector2(horizontal, vertical)
	
	velocity = direction * 150
	
	if velocity == Vector2(0,0):
		char_anim.play("idle")
	else:
		char_anim.play("walk")
	
	move_and_slide()


