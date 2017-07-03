extends TextureButton


onready var label  = get_node("label")
onready var number = get_node("number")
onready var lock   = get_node("lock")
onready var path   = ""

func set_levelName(t)   : label.set_text(t)
func set_levelNumber(n) : number.set_text(String(n))
func set_levelPath(p)   : self.path = p 
func set_locked(locked):
	set_disabled(locked)
	label.set_hidden(locked)
	number.set_hidden(locked)
	lock.set_hidden(!locked)

func _on_TextureButton_pressed():
	if self.path != "" : globals.Transition.fade_to(path)
