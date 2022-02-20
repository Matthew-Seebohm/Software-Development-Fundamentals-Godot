extends KinematicBody2D

var movement_speed = 400




func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(movement_speed * delta, 0))
	if position.x <= 10:
		move_and_collide(Vector2(movement_speed * delta, 0))
	if position.x >= 1250:
		move_and_collide(Vector2(-movement_speed * delta, 0))
