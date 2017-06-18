tool
extends ParallaxBackground

var offsetloc = 0
onready var background_frame = TextureFrame.new()
onready var border_frame = TextureFrame.new()
onready var background_layer = ParallaxLayer.new()
onready var border_layer = ParallaxLayer.new()
export(Vector2) var mirroring = Vector2(1019,0)
export(Texture) var background
export(Texture) var border
export(bool) var border_expand
export(Vector2) var border_size = Vector2(1024,600)
export(int) var speed_scrolling = -55

func set_border(path) :
	border = load(path)
func set_background(path) :
	background = load(path)
func _ready():
	if background != null :
		background_layer.add_child(background_frame)
		background_layer.set_mirroring(mirroring)
		background_frame.set_texture(background)
		self.add_child(background_layer)
		set_fixed_process(true)
	if border != null :
		border_frame.set_expand(border_expand)
		border_frame.set_size(border_size)
		border_frame.set_stretch_mode(0)
		border_layer.add_child(border_frame)
		border_frame.set_texture(border)
		self.add_child(border_layer)


func _fixed_process(delta):
	offsetloc += speed_scrolling * delta 
	if background_layer != null :
		background_layer.set_motion_offset(Vector2(offsetloc,0))

func _on_Button_button_down():
	print("down")
