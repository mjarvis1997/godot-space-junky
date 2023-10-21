extends ParallaxBackground

var speeds = [1.0, 2.0, 3.0, 6.0]
var scaling_factor = 0.2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.RIGHT
	$ParallaxLayer.motion_offset.x += speeds[0] * scaling_factor
	$ParallaxLayer2.motion_offset.x += speeds[1] * scaling_factor
	$ParallaxLayer3.motion_offset.x += speeds[2] * scaling_factor
	$ParallaxLayer4.motion_offset.x += speeds[3] * scaling_factor
