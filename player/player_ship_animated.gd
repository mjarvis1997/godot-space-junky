extends AnimatedSprite2D

signal shoot(Bullet, direction, position)
var Mini_Rocket = load("res://projectiles/mini_rocket.tscn")

var speed = 400
var rotation_speed = PI

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movementVector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var rotationDirection = 0
	var joypadPosition = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
		
	if joypadPosition != Vector2(0,0):
		print(joypadPosition)
		
	position += movementVector * speed * delta
	rotation += rotationDirection * rotation_speed * delta
	
	# Rotation Inputs
	if Input.is_action_pressed("player_turn_left"):
		rotation -= rotation_speed  * delta
		animation = "rotate_left"
	elif Input.is_action_pressed("player_turn_right"):
		rotation += rotation_speed  * delta
		animation = "rotate_right"
	else:
		animation = "idle"
		
		
func _on_fire_button():
	var new_projectile = Mini_Rocket.instantiate()
	add_child(new_projectile)
	
func _input(event):
	if event is InputEventJoypadButton:
		if event.is_action_pressed("player_shoot"):
			shoot.emit(Mini_Rocket, rotation, $ProjectileStart.global_position);
