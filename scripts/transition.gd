extends TextureFrame

# STORE THE SCENE PATH
var path = ""
var state
## SIGNALS
signal midTransition

func is_on_the_middle() : emit_signal("midTransition")


# PUBLIC FUNCTION. CALLED WHENEVER YOU WANT TO CHANGE SCENE
func fade_to(scn_path, state = null):
	self.path = scn_path # store the scene path
	self.state = state
	get_node("AnimationPlayer").play("fade") # play the transition animation
func switch_to(scn_path):
	self.path = scn_path # store the scene path
	goto()
# PRIVATE FUNCTION. CALLED AT THE MIDDLE OF THE TRANSITION ANIMATION
func goto():
	if path != "":
		get_tree().change_scene(path)
	if state != null :
		globals.set_state(state)
		
		