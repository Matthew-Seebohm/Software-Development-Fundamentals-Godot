extends KinematicBody2D
#This script controls different aspects of the player, such as speed, movement and bullets

#These variables detirmine different aspects of the player like speed and bullets
var movement_speed = 400
var vertical_speed = 0
var bulletSource = preload ("res://Bullet/Bullet.tscn")
var speed = 500

#allows physics to be applied to the player
func _ready():
	set_process(true)
	set_physics_process(true)

#Allows the player to mv by using the arrow keys, as detirmined by the "ui_direction"
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(vertical_speed * delta, -10))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(vertical_speed * delta, 10))
#The 4 lines below make sure the player doesn't move outside the screen
	if position.x <= 10:
		move_and_collide(Vector2(movement_speed * delta, 0))
	if position.x >= 1250:
		move_and_collide(Vector2(-movement_speed * delta, 0))

#This code fires the bullet if the key "fire" is pressed
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y -65)
		get_tree().get_root().add_child(bulletInstance)
#The timeout code is a failed attempt of slowing down the firerate
		yield(get_tree().create_timer(2.0), "timeout")
