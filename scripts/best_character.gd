extends CharacterBody2D

var dash = 2
var attack = 1
var alivechar = true
@export var speed = 300
@onready var char_anim = get_node("AnimationTree")
@onready var switch_anim = get_node("switch_effect")
var char_scenes = ["res://scenes/best_character.tscn","res://scenes/priestess_char.tscn","res://scenes/magistr_char.tscn"]

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var number : int

func _ready():
	$HealthComponent.health =  Info.char_hp[number]

func _process(delta):
	Info.char_hp[number] = $HealthComponent.health
	

func _physics_process(delta):
	if alivechar:
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
	
func attack_all():
	var bodies = $"attack_area".get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.is_in_group("enemy"):
			body.get_node("HealthComponent").take_damage(50) 

func _input(event):
	if event is InputEventKey:
		if Input.get_action_strength("one") and $switch_effect/switch_eff_kd.is_stopped():
			switch_char(0)
		if Input.get_action_strength("two") and $switch_effect/switch_eff_kd.is_stopped():
			switch_char(1)
		if Input.get_action_strength("three") and $switch_effect/switch_eff_kd.is_stopped():
			switch_char(2)

#вызывается СТАРЫМ персонажем
func switch_char(to_char):
	if to_char == -1:
		to_char = ((number + 1) % 3)
	#if Info.char_hp[0] == 0 and Info.char_hp[1] == 0 and Info.char_hp[2] == 0:
		#
		#return
	for character in range(len(Info.char_hp)):
		if Info.char_hp[to_char] <= 0:
			to_char = (to_char + 1) % 3
		else:
			break
		$"../".get_tree().change_scene_to_file.bind("res://levels/Menu/menu.tscn").call_deferred()
		Info.char_hp = [100,100,100]
	var next_char = load(char_scenes[to_char])
	var hero = next_char.instantiate()
	hero.position = self.position + Vector2(0,0)
	hero.scale = self.scale
	$"../camera1".follow_char = hero
	$"..".add_child(hero)
	hero.get_node("switch_effect").visible = true
	hero.switch_anim.play("switch")
	self.queue_free()


func _on_switch_eff_kd_timeout():
	$switch_effect.visible = false
	


func _on_health_component_out_of_health():
	self.get_node("AnimationTree").active = false
	alivechar = false
	self.get_node("AnimationPlayer").play("death")
	$death_timer.start()
	
	#switch_char((number + 1) % 3)


func _on_death_timer_timeout():
	alivechar = true
