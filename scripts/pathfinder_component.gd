extends NavigationAgent2D

var direction := Vector2(0,0)
@onready var target : CharacterBody2D = self.get_parent()
@onready var level_scale = get_node("../..").scale
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	target = $".."
	var bodies = $"../detection_area".get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("hero"):
			target = body
			break
		else:
			target = $".."
	target_position = target.position * level_scale.x
	direction = get_next_path_position() - get_node("..").position * level_scale.x
	##print(get_node("..").position)
	#print(get_next_path_position())
	#print(target.position)
