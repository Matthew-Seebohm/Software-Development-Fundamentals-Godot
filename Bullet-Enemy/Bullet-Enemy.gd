extends KinematicBody2D
#This script runs for each bullet fired by the enemies

var speed = 500

#This fuction detirmines if the enemy applies to the physics
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)

#This code detects if the bullet collides with either an enemy or player
# if it's an enemy it disregards it, but if it's a player it sends the player to the endscene
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		if "Enemy" in collidedObject.collider.name:
			pass
		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)
		if "Player" in collidedObject.collider.name:
			get_tree().change_scene("res://Endscene.tscn")
			queue_free()
