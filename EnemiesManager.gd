extends Node2D

var availableEnemies = 0
var killedEnemies = 0

func _ready():
	availableEnemies = get_children().size()
	
func onEnemyKilled():

	killedEnemies += 1
	if killedEnemies >= availableEnemies:
		var gameover = Global.GameOverScreen.instance()
		add_child(gameover)

