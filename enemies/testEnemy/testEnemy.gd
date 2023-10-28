extends CharacterBody2D


const SPEED = 300.0

@onready var player = Globals.get("player")


func _physics_process(delta):
	var self_position = global_position
	
	if player:
		var player_location = player.global_position
	
		var direction = player_location - self_position
		direction = direction.normalized()

		var motion = direction * SPEED * delta
		move_and_collide(motion)
	
