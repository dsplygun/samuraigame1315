extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var direction = Vector2(horizontal, vertical)

	velocity = direction * 150
	
	if Input.get_action_strength("attack"):
		$wand_time.start()
		$wand/wand_zone.monitoring = true
		$wand/wand_zone.monitorable = true
		$wand.visible = true
	
	move_and_slide()


func _on_wand_time_timeout():
	$wand.visible = false
	$wand/wand_zone.monitoring = false
	$wand/wand_zone.monitorable = false
