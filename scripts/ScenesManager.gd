extends Node2D
## Load the current scene (menu or level)
onready var s
onready var t
func _ready():
	t = load(globals.get_current_scene())
	s = t.instance()
	add_child(s)
