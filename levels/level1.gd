extends Node
func _ready():
	get_node("Settings/CanvasLayer/VBoxContainer/Back button").connect("pressed",self,"_on_Back_button_pressed")
	globals.Streamer.set_stream(globals.theme_inGame)
	if !(globals.Streamer.is_playing()): globals.Streamer.play()
func _on_Back_button_pressed():
	get_node("Settings").Comeback_settings()