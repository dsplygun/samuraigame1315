extends CharacterBody2D

#@export var target : CharacterBody2D
@export var enemy_speed = 100
#@onready var char_anim = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false

	move_and_slide()

func _on_health_component_out_of_health():
	self.queue_free()

func attack_all():
	var bodies = $"attackarea".get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("hero"):
			body.get_node("HealthComponent").take_damage(10) 
	
func set_velocity_to_target():
	velocity = ($PathfinderComponent.direction).normalized() * enemy_speed
