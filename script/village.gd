extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass#print(Inventory.Inv)
	

func _input(event):
	if event is InputEventKey and  Input.get_action_strength("esc"):
		if $"game intr".visible:
			$"game intr".visible = false
		else:
			$"game intr".visible = true
			
	if event is InputEventKey and  Input.get_action_strength("e"):
		if $"intr/ItemList".visible:
			$"intr/ItemList".visible = false
		else:
			$"intr/ItemList".visible = true

