extends Button

func _on_Button_pressed() :
	LevelManager.lvl2.locked = false
	globals.Transition.fade_to("res://scenes/MenuScene.xml",3)
	LevelManager.save_game()