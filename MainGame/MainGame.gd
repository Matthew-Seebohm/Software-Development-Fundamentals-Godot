extends Control

export(int) var countdownMax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > -1:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print ("Game Over")
	$HUD/Countdown.text = str ("Gama Ovar")
	
	get_tree().change_scene("res://Endscene.tscn")
	
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
