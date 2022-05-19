extends KinematicBody2D
#This script controls aspects of the bullets fired by the player

var speed = 500

#this function detirmines if the bullet applies to the physics
func _ready():
	set_physics_process(true)

#This function detirmines if the bullet has collided with an object with the tag "enemy", if so
#it deletes the bullet
func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] +=10
		queue_free()
