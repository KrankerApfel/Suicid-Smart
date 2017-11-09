extends Node
## STATE MANAGER
onready var state
onready var TITLE = 0
onready var SETTINGS = 1
onready var GAME_OVER = 2
onready var IN_GAME = 3
onready var CRT_activated = true
onready var FULLSCREEN_activated = false
onready var RUNNERMODE_activated = false
func set_state(s) : state = s
func get_state() : return state

## SCENE MANAGER
onready var current_scene 
onready var SFX = get_node("SFX")
onready var Streamer = get_node("StreamPlayer")
func get_current_scene() : return current_scene
func set_current_scene(path) : current_scene = path

## SOUND MANAGER
onready var volume_SFX = 50.0
onready var volume_Music = 50.0
onready var theme_menu = load("res://assets/audios/theme_menu.ogg")
onready var theme_inGame = load("res://assets/audios/theme_Game.ogg")
onready var theme_gameOver = load("res://assets/audios/theme_GameOver.ogg")

## TRANSITIONS
onready var Transition = get_node("CanvasLayer/Transition")
## SOUND MANAGER
func get_volume_SFX() : return volume_SFX
func get_volume_Music() : return volume_Music
func set_volume_SFX(v) : 
	volume_SFX = v
	AudioServer.set_fx_global_volume_scale(volume_SFX/100)
func set_volume_Music(v) :
	volume_Music = v
	AudioServer.set_stream_global_volume_scale(volume_Music/100)

func streamer_update():
	if current_scene == "res://scenes/MenuScene.xml" :
		if !Streamer.is_playing() :
			if state == TITLE: Streamer.set_stream(theme_menu)
			if state == GAME_OVER : Streamer.set_stream(theme_gameOver)
	else :
		if !Streamer.is_playing() : 
			if state == IN_GAME: 
				Streamer.set_stream(theme_inGame)

## INPUT MANAGER
func _input(event): if Input.is_action_pressed("ui_cancel") : get_node("CanvasLayer/QUIT").show(); 
func _on_ConfirmationDialog_confirmed(): OS.get_main_loop().quit();

## INITIALISATION
func _ready():
	set_process_input(true);
	state = TITLE
	set_current_scene("res://scenes/MenuScene.xml")
	AudioServer.set_stream_global_volume_scale(volume_Music/100)
	AudioServer.set_fx_global_volume_scale(volume_SFX/100)
	Streamer.set_stream(theme_menu)
	



