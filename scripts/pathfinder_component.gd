extends NavigationAgent2D

var direction := Vector2(0,0)
@onready var target : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	direction = get_next_path_position() - get_node("..").position
	var bodies = $"../detection_area".get_overlapping_bodies()
	for body in bodies:
		if "best_character" in body.name:
			target_position = target.position
		else:
			target_position = $"..".position

