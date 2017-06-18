extends Node
## STATE MANAGER
onready var state
onready var TITLE = 0
onready var SETTINGS = 1
onready var GAME_OVER = 2
onready var CRT_activated = true
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

func get_volume_SFX() : return volume_SFX
func get_volume_Music() : return volume_Music
func set_volume_SFX(v) : 
	volume_SFX = v
	AudioServer.set_fx_global_volume_scale(volume_SFX/100)
func set_volume_Music(v) :
	volume_Music = v
	AudioServer.set_stream_global_volume_scale(volume_Music/100)
## INITIALISATION
func _ready():
	state = TITLE
	set_current_scene("res://scenes/MenuScene.xml")
	AudioServer.set_stream_global_volume_scale(volume_Music/100)
	AudioServer.set_fx_global_volume_scale(volume_SFX/100)
	Streamer.set_stream(theme_menu)
	Streamer.play()


func _fixed_process(delta):
	if Streamer.is_playing() != true :
		if current_scene == "res://scenes/MenuScene.xml" :
			if state == TITLE: Streamer.set_stream(theme_menu)
			if state == GAME_OVER : Streamer.set_stream(theme_gameOver)
		else : Streamer.set_stream(theme_inGame)
		Streamer.play()