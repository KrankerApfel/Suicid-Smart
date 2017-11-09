extends Button

func _on_Button_pressed() :
	LevelManager.lvl2.locked = false
	globals.Transition.fade_to("res://scenes/MenuScene.xml",3)
	globals.Streamer.set_stream(globals.theme_menu)
	LevelManager.save_game()