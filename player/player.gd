extends CharacterBody2D

signal shoot(Bullet, direction, position)
var Mini_Rocket = load("res://projectiles/mini_rocket.tscn")

var speed = 400
var rotation_speed = PI

func _ready():
	# Set a global reference to our player (see Globals.gd)
	Globals.set("player", self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	handle_rotation(delta)
	handle_movement(delta)
		
func _on_fire_button():
	var new_projectile = Mini_Rocket.instantiate()
	add_child(new_projectile)
	
func _input(event):
	if event.is_action_pressed("player_shoot"):
		shoot.emit(Mini_Rocket, rotation, $ProjectileStart.global_position);

func handle_movement(delta):
	if !Input.is_anything_pressed():
		return
	if Input.is_action_pressed("player_move_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("player_move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("player_move_right"):
		position.x += speed * delta
	if Input.is_action_pressed("player_move_left"):
		position.x -= speed * delta


func handle_rotation(delta):
	# Rotation Inputs
	if !Input.is_anything_pressed():
		$Sprite.animation = "idle"
		return
	if Input.is_action_pressed("player_turn_left"):
		rotation -= rotation_speed * delta
		$Sprite.animation = "rotate_left"
	elif Input.is_action_pressed("player_turn_right"):
		rotation += rotation_speed * delta
		$Sprite.animation = "rotate_right"
	
func take_damage(damage):
	$Health.take_damage(damage)
	
