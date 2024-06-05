extends CharacterBody2D

var dash = 2
var attack = 1
@export var speed = 300
@onready var char_anim = get_node("AnimationTree")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var direction = Vector2(horizontal, vertical)
	
	velocity = direction * speed
	
	if direction != Vector2(0,0):
		$AnimationTree["parameters/idle/blend_position"] = direction
		$AnimationTree["parameters/walk/blend_position"] = direction 
		$AnimationTree["parameters/dash/blend_position"] = direction
		if $attack_timer.is_stopped():
			$AnimationTree["parameters/attack/blend_position"] = direction
	
	
	if Input.is_action_just_pressed("attack") or not $attack_timer.is_stopped():
		if $attack_timer.is_stopped() and attack > 0:
			$attack_timer.start()
			attack -= 1
			speed = 0
			$attack_kd.start()
			char_anim.get("parameters/playback").travel("attack")
	elif Input.get_action_strength("dash") or not $dash_anim.is_stopped():
		if $dash_anim.is_stopped() and dash > 0:
			speed = 600
			$dash_anim.start()
			dash -= 1
			$dash_timer.start()
			char_anim.get("parameters/playback").travel("dash")
			
	elif velocity == Vector2(0,0):
		char_anim.get("parameters/playback").travel("idle")
	elif velocity.length() > 0:
		char_anim.get("parameters/playback").travel("walk")

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


func _on_attack_timer_timeout():
	speed = 300
	

func _input(event):
	if event is InputEventKey:
		if Input.get_action_strength("one"):
			switch_char("res://scenes/best_character.tscn")
		if Input.get_action_strength("two"):
			switch_char("res://scenes/priestess_char.tscn")
		if Input.get_action_strength("three"):
			switch_char("res://scenes/magistr_char.tscn")

func switch_char(to_char):
	var next_char = load(to_char)
	var hero = next_char.instantiate()

	
	hero.position = self.position + Vector2(0,0)
	hero.scale = self.scale
	
	$"../camera1".follow_char = hero
	print(self.position)
	print(hero.position)
	$"..".add_child(hero)
	self.queue_free()

