extends KinematicBody2D

var movement_speed = 400
var vertical_speed = 0
var bulletSource = preload ("res://Bullet/Bullet.tscn")


func _ready():
	set_process(true)
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(vertical_speed * delta, -10))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(vertical_speed * delta, 10))
	if position.x <= 10:
		move_and_collide(Vector2(movement_speed * delta, 0))
	if position.x >= 1250:
		move_and_collide(Vector2(-movement_speed * delta, 0))

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-50)
		get_tree().get_root().add_child(bulletInstance)
		yield(get_tree().create_timer(2.0), "timeout")
