extends CharacterBody2D



@onready var fire_delay_node = $FireDelayTimer
@onready var cannons = $Cannons
@onready var state_machine = preload("res://SateMachine.gd").new()


var random_number = RandomNumberGenerator.new()

var Mini_Rocket = load("res://projectiles/mini_rocket.tscn")

const SPEED = 215.0
const COLLISION_DAMAGE = 20


var fireDelay: float = 2.0

func _physics_process(delta):
	var player_location = Globals.player.global_position
	var movement_vector = delta * SPEED
	
	var overshot = random_number.randf_range(-20.0, 20.0)
	var current_pos = global_position
	# Just move side to side
	var move = Vector2(player_location.x + overshot, global_position.y)

	global_position =  global_position.move_toward(move, movement_vector)

	shoot()
	
func shoot():
	# Meaning the timer isn't running
	if fire_delay_node.is_stopped():
		fire_delay_node.start(fireDelay)
		for cannon in cannons.get_children():

			Signals.shoot.emit(Mini_Rocket, PI, cannon.global_position)
		
		

func _on_body_entered(body):
	print('enemy body entered!')
	if body.is_in_group("Player"):
		body.take_damage(COLLISION_DAMAGE)
	pass # Replace with function body.
