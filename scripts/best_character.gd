extends CharacterBody2D
#var side = true
var dash = 2
var attack = 1
@export var speed = 300
@onready var char_anim = get_node("AnimationPlayer")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var direction = Vector2(horizontal, vertical)
	
	#if $attack_timer.is_stopped():
	velocity = direction * speed
		
	
	if Input.is_action_just_pressed("attack") or not $attack_timer.is_stopped():
		if $attack_timer.is_stopped() and attack > 0:
			$attack_timer.start()
			attack -= 1
			$attack_kd.start()
			char_anim.play("attack_front")#+side
	elif Input.get_action_strength("dash") or not $dash_anim.is_stopped():
		if $dash_anim.is_stopped() and dash > 0:
			speed = 600
			$dash_anim.start()
			dash -= 1
			$dash_timer.start()

			char_anim.play("dash_right")
			
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


func _on_dash_timer_timeout():
	dash = 2
	speed = 300


func _on_dash_anim_timeout():
	if dash == 0:
		$freeze_timer.start()
		speed = 150
	else:
		speed = 300


func _on_freeze_timer_timeout():
	speed = 300


func _on_attack_kd_timeout():
	attack = 1
