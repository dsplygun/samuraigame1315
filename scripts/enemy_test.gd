extends CharacterBody2D

@export var target : Node2D
@export var enemy_speed = 100
@onready var char_anim = get_node("AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	$PathfinderComponent.target = self.target


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = ($PathfinderComponent.direction).normalized()
	velocity = direction * enemy_speed
	
	if $PathfinderComponent.distance_to_target() < 125:
		velocity = Vector2(0,0)
	var bodies = $"death_area".get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("hero"):
			body.get_node("HealthComponent").take_damage(1)
			break
	if velocity.x == 0 and velocity.y == 0:
		char_anim.play("idle")
	#if direction == Vector2(0,1):
		#char_anim.play("run_down")
	#if direction == Vector2(0,-1):
		#char_anim.play("run_up")
	if velocity.x < 0:
		char_anim.play("run_left")
	if velocity.x > 0:
		char_anim.play("run_right")	
	move_and_slide()
	
	#look_at( get_node("../shooter").position )


func _on_death_area_area_entered(area):
	if area.is_in_group("wand"):
		queue_free()


func _on_health_component_out_of_health():
	self.queue_free()

