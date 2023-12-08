extends Area2D

var velocity : float = 700.0

func _process(delta : float) -> void:
	var adjusted_rotation = rotation - PI/2
	var direction = Vector2(cos(adjusted_rotation), sin(adjusted_rotation))

	# Update the position. Use delta to make the speed consistent on different PCs
	position += direction * velocity * delta


func init(pos : Vector2, rot : float) -> void:
	position = pos
	rotation = rot
