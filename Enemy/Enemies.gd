extends Node2D
#this script controls all the enemies grouped together

#the speed enemies move at
var speed = -200

func _ready():
	set_physics_process(true)

#This determines the speed enemies move at
func _physics_process(delta):
	global_position.x += speed * delta
	pass
