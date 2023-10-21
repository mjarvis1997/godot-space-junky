extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_shoot(Bullet, direction, position):
	print('creating bullet')
	var new_bullet = Bullet.instantiate()
	add_child(new_bullet)
	new_bullet.rotation = direction
	new_bullet.position = position
	new_bullet.velocity = new_bullet.velocity.rotated(direction)

