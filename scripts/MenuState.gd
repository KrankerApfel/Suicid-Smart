extends CanvasLayer

onready var TITLE = 0
onready var SETTINGS = 1
onready var GAME_OVER = 2
onready var CHOOSE_LEVEL = 3
onready var title = get_node("Title")
func _ready():
	call_menu(globals.get_state())
	
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
		#Transition.fade_tp("res://scenes/MenuScene.xml", globals.get_state() = TITLE)
		globals.Transition.fade_to("res://scenes/MenuScene.xml", TITLE)

func _on_Label2_pressed(): OS.get_main_loop().quit()
func _on_Back_button_pressed():
	if globals.get_state() or globals.get_state() == 3 :
		globals.Transition.fade_to("res://scenes/MenuScene.xml", TITLE)
