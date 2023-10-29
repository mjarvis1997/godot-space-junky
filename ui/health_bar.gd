extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect to global signal so we can respond when its emitted
	Signals.player_health_changed.connect(self.update_health_bar)

func update_health_bar(value):
	print('update health bar!')
	$TextureProgressBar.value = value
	
