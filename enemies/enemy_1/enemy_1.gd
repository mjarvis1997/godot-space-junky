extends Area2D

const SPEED = 250.0
const COLLISION_DAMAGE = 20

func _physics_process(delta):
	var player_location = Globals.player.global_position
	var movement_vector = delta * SPEED
	global_position = global_position.move_toward(player_location, movement_vector)


func _on_body_entered(body):
	print('enemy body entered!')
	if body.is_in_group("Player"):
		body.take_damage(COLLISION_DAMAGE)
	pass # Replace with function body.
