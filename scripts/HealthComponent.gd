extends Node
signal out_of_health

@export var health : int = 10
@onready var max_health = health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(dmg : int):
	health -= dmg
	$"../zvuki".hit_sound()
	if health <= 0:
		health = 0
		emit_signal("out_of_health")
func heal(value):
	health += value
	if health > max_health:
		health = max_health
func death():
	$"../".queue_free()
	
