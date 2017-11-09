extends Control
var path = ""
func _ready(): CRT.get_node("CRT/TextureFrame").hide()
func play_SFX(sound) :
	get_node("SamplePlayer").play(sound)

func next(scn_path):
	self.path = scn_path 
	if path != "":
		#get_tree().change_scene(path)
		globals.Transition.fade_to("res://scenes/MenuScene.xml", 0)