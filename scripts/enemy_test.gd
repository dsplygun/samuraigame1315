extends CharacterBody2D

@export var target : Node2D
@export var enemy_speed = 100
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
		
	print(position)
	move_and_slide()
	
	#look_at( get_node("../shooter").position )


func _on_death_area_area_entered(area):
	if area.is_in_group("wand"):
		queue_free()


func _on_health_component_out_of_health():
	self.queue_free()
