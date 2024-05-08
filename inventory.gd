extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
var Inv = Array()

func add(item):
	Inv.append(item)
	
func remove(item):
	Inv.erase(item)
func check_item(item):
	if item in Inv:
		return true
	else:
		return false
var gold = int()
func earn_gold(amount):
	gold+=amount
func spend_gold(amount):
	if gold<amount:
		return false
	else:
		gold-=amount
		return true
