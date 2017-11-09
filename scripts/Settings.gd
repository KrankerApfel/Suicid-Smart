extends Node
onready var canplay = false
func _ready():
	get_node("CanvasLayer/VBoxContainer/sfx bar/SpinBox_sfx").set_value(globals.get_volume_SFX())
	get_node("CanvasLayer/VBoxContainer/music bar/SpinBox_music").set_value(globals.get_volume_Music())
	get_node("CanvasLayer/VBoxContainer/HBoxContainer/Fullscreen").set_pressed(globals.FULLSCREEN_activated)
	get_node("CanvasLayer/VBoxContainer/HBoxContainer/Rmode").set_pressed(globals.RUNNERMODE_activated)
	get_node("CanvasLayer/VBoxContainer/HBoxContainer/Shader").set_pressed(globals.CRT_activated)
	
	set_process_input(true)
	selfState = InGame
	
func _on_sfx_bar_value_changed( value ):
	get_node("CanvasLayer/VBoxContainer/sfx bar/SpinBox_sfx").set_value(value)
	globals.set_volume_SFX(value)
	if canplay : globals.SFX.play("select")


func _on_music_bar_value_changed( value ):
	get_node("CanvasLayer/VBoxContainer/music bar/SpinBox_music").set_value(value)
	globals.set_volume_Music(value)


func _on_SpinBox_sfx_value_changed( value ): get_node("CanvasLayer/VBoxContainer/sfx bar").set_value(value) 

func _on_SpinBox_music_value_changed( value ): get_node("CanvasLayer/VBoxContainer/music bar").set_value(value)


func _on_Fullscreen_toggled( pressed ): 
	OS.set_window_fullscreen(pressed)
	globals.FULLSCREEN_activated = pressed



func _on_Shader_toggled( pressed ): 
	globals.CRT_activated = pressed
	if pressed : 
		CRT.get_node("CRT/TextureFrame").show()
		CRT.get_node("CRT/Border").hide()
	else : 
		CRT.get_node("CRT/TextureFrame").hide()
		CRT.get_node("CRT/Border").show()


func _on_Rmode_toggled( pressed ):
	globals.RUNNERMODE_activated = pressed
	pass # replace with function body
	
## ----- CALL MENU FUNCTIONS

onready var InGame = 0
onready var SETTINGS = 1
onready var selfState = InGame
onready var settings = self
onready var canCall = true

func _input(event):
	if Input.is_action_pressed("pause") :
		if selfState == InGame and canCall: call_settings()
		elif selfState == SETTINGS : Comeback_settings()
func call_settings() :
	globals.SFX.play("select")
	selfState = SETTINGS
	settings.canplay = true
	settings.get_node("CanvasLayer/VBoxContainer").show()
	settings.show()
	get_tree().set_pause(true)

func Comeback_settings() :
	globals.SFX.play("select")
	selfState = InGame
	settings.canplay = false
	settings.get_node("CanvasLayer/VBoxContainer").hide()
	settings.hide()
	get_tree().set_pause(false)



