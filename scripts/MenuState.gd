extends CanvasLayer
onready var TITLE = 0
onready var SETTINGS = 1
onready var GAME_OVER = 2
onready var CHOOSE_LEVEL = 3
onready var title = get_node("Title")
func _ready():
	if !(globals.Streamer.is_playing()): globals.Streamer.play()
	if globals.CRT_activated: CRT.get_node("CRT/TextureFrame").show()
	call_menu(globals.get_state())
	get_node("Settings/CanvasLayer/VBoxContainer/Back button").connect("pressed",self,"_on_Back_button_pressed")
	get_node("Settings").canCall = false
	
func call_menu(name) :
	globals.set_state(name)
	
	if globals.get_state() == 0 : 
		title.set_text("Suicid Smart")
		get_node("Normal menu/VBoxContainer/Label").set_text("Choose level")
		get_node("Normal menu/VBoxContainer/Label1").set_text("Settings")
		get_node("Normal menu/VBoxContainer/Label2").set_text("Quit")
		get_node("Settings").hide()
		get_node("Settings/CanvasLayer/VBoxContainer").hide()
		get_node("Choose level").hide()
		get_node("Normal menu").show()
		
	if globals.get_state() == 1 : 
		title.set_text("Settings")
		get_node("Settings").canplay = true
		get_node("Normal menu").hide()
		get_node("Settings/CanvasLayer/VBoxContainer").show()
		get_node("Choose level").hide()
		get_node("Settings").show()
	if globals.get_state() == 2 : 
		title.set_text("Game Over")
		get_node("Normal menu/VBoxContainer/Label").set_text("Restart")
		get_node("Normal menu/VBoxContainer/Label1").set_text("Back to title screen")
		get_node("Normal menu/VBoxContainer/Label2").set_text("Quit") 
		get_node("Settings/CanvasLayer/VBoxContainer").hide()
		get_node("Settings").hide()
		get_node("Choose level").hide()
		get_node("Normal menu").show()
	if globals.get_state() == 3 : 
		title.set_text("Choose Level")
		get_node("Settings/CanvasLayer/VBoxContainer").hide()
		get_node("Settings").hide()
		get_node("Normal menu").hide()
		get_node("Choose level").show()


func _on_any_button_pressed() : globals.SFX.play("valid")

func _on_Label_pressed():
	if globals.get_state() == 0 : 
		globals.Transition.fade_to("res://scenes/MenuScene.xml",CHOOSE_LEVEL)
	if globals.get_state() == 2 : 
		print("restart")
func _on_Label1_pressed():
	if globals.get_state() == 0 : 
		globals.Transition.fade_to("res://scenes/MenuScene.xml", SETTINGS)
	if globals.get_state() == 2 : 
		globals.Transition.fade_to("res://scenes/MenuScene.xml", TITLE)

func _on_Label2_pressed(): globals.get_node("CanvasLayer/QUIT").show();
func _on_Back_button_pressed():
	if globals.get_state() or globals.get_state() == 3 :
		globals.set_state(globals.TITLE)
		globals.set_current_scene("res://scenes/MenuScene.xml")
		globals.Transition.fade_to("res://scenes/MenuScene.xml", TITLE)

