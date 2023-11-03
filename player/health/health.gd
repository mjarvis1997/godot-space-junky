extends Node

var health = 0
var max_health = 100

var testTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	pass # Replace with function body.
	
func take_damage(damage):
	health -= damage
	print("Taking damage, current health: ", health)
	Signals.emit_signal("player_health_changed", health)
