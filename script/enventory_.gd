extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.add("монета")
	Inventory.add("меч")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear()
	for item in Inventory.Inv:
		add_item(item)
	
