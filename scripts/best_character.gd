extends CharacterBody2D
#var side = true

@onready var char_anim = get_node("AnimationPlayer")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var direction = Vector2(horizontal, vertical)
	
	#if $attack_timer.is_stopped():
	velocity = direction * 150
		
	
	if Input.get_action_strength("attack") or not $attack_timer.is_stopped():
		if $attack_timer.is_stopped():
			$attack_timer.start()
		char_anim.play("attack_front")#+side
	elif direction == Vector2(0,0):
		char_anim.play("idle")
	elif direction == Vector2(0,1):
		char_anim.play("walk_front")
	elif direction == Vector2(0,-1):
		char_anim.play("walk_back")
	elif direction == Vector2(-1,0):
		char_anim.play("walk_left")
	elif direction == Vector2(1,0):
		char_anim.play("walk_right")

	move_and_slide()


