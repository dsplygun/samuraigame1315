extends Node
var gold : int = 0
var Inv = Array()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add(item):
	Inv.append(item)
	
func remove(item):
	Inv.erase(item)
	
func check_item(item):
	if item in Inv:
		return true
	else:
		return false

func earn_gold(amount):
	gold+=amount
	
func spend_gold(amount):
	if gold<amount:
		return false
	else:
		gold-=amount
		return true
