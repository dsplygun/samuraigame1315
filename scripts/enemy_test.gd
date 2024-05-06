extends CharacterBody2D

@export var enemy_speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var direction = (get_node("../best_character").position - position).normalized()
	velocity = direction * enemy_speed
	
	if (get_node("../best_character").position - position).length() < 125:
		velocity = Vector2(0,0)
	
	move_and_slide()
	
	#look_at( get_node("../shooter").position )


func _on_death_area_area_entered(area):
	if area.is_in_group("wand"):
		queue_free()
