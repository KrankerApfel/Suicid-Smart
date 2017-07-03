extends Control

## Set grid state

onready var grid = get_node("GridContainer")
onready var i = 1
func _ready(): load_grid()

func load_grid() : 
	var data = LevelManager.load_game()
	print(data)
	for c in range(data.size() - 1) :
			var btn = load("res://scenes/levelSelectButton.xml").instance()
			grid.add_child(btn)
	for child in grid.get_children() :
		child.set_levelNumber(i)
		if i <= data.size() :
			child.set_levelName(data[i-1].name)
			child.set_levelPath(data[i-1].path)
			child.set_locked(data[i-1].locked)
		i += 1
