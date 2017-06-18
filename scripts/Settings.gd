extends Node
onready var canplay = false
func _ready():
	get_node("CanvasLayer/VBoxContainer/sfx bar/SpinBox_sfx").set_value(globals.get_volume_SFX())
	get_node("CanvasLayer/VBoxContainer/music bar/SpinBox_music").set_value(globals.get_volume_Music())

func _on_sfx_bar_value_changed( value ):
	get_node("CanvasLayer/VBoxContainer/sfx bar/SpinBox_sfx").set_value(value)
	globals.set_volume_SFX(value)
	if canplay : globals.SFX.play("select")


func _on_music_bar_value_changed( value ):
	get_node("CanvasLayer/VBoxContainer/music bar/SpinBox_music").set_value(value)
	globals.set_volume_Music(value)


func _on_SpinBox_sfx_value_changed( value ): get_node("CanvasLayer/VBoxContainer/sfx bar").set_value(value) 

func _on_SpinBox_music_value_changed( value ): get_node("CanvasLayer/VBoxContainer/music bar").set_value(value)


func _on_Fullscreen_toggled( pressed ): OS.set_window_fullscreen(pressed)



func _on_Shader_toggled( pressed ): 
	if pressed : 
		Main.get_node("CRT/TextureFrame").show()
		Main.get_node("CRT/Border").hide()
	else : 
		Main.get_node("CRT/TextureFrame").hide()
		Main.get_node("CRT/Border").show()
