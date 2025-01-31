extends KinematicBody2D
#this script is for controlling the enemies movement, bullets and speed

var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")

#This function connects the enemies together in groups
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

#This function detirmines the horizontal and vertical movement of the enemies
func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -200
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = 200

#this function uses a random number generator (rng) to tell when the enemie to shoot
func _process(delta):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(2.0, 30.0)
	yield(get_tree().create_timer(my_random_number), "timeout")
	if GlobalVariables.enemyBulletInstanceCount < 5:
		var bulletInstance = bullet.instance()
		
		bulletInstance.position = Vector2(global_position.x, global_position.y +5)
		get_tree().get_root().add_child(bulletInstance)
