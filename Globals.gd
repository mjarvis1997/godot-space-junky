extends Node

# Reference to player
var player

# Add other global variables here?
var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("shoot", shoot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shoot(Bullet, rotation: float, position: Vector2):
	var base_velocity = Vector2(200, 0)

	var new_projectile = Bullet.instantiate()
	new_projectile.init(position,
						rotation)
	get_parent().add_child(new_projectile)
