extends Node
## LEVEL MANAGER
var lvl1 = {
		name = "lvl 1",
		path = "res://levels/level1.xml",
		locked = false
	}
var lvl2 = {
		name = "lvl 2",
		path = "res://levels/level2.xml",
		locked = true
		}
var lvl3 = {
		name = "lvl 3",
		path = "res://levels/level3.xml",
		locked = true
	}
func grid() :
	var grid = [lvl1,lvl2,lvl3]
	return grid
	
func save_game():
	var savegame= File.new()
	savegame.open("res://data/savegame.bin", File.WRITE)
	## Save levels grid data
	var grid = grid()
	for level in grid :
		var data = level
		savegame.store_line(data.to_json())
	## Save mode runner Highscore
	## ... 
	savegame.close()
	
func load_game() :
	var savegame = File.new()
	var newGrid = []
	if !savegame.file_exists("res://data/savegame.bin"):
        save_game()
	savegame.open("res://data/savegame.bin", File.READ)
	while (!savegame.eof_reached()):
        var currentline = {} 
        currentline.parse_json(savegame.get_line())
        if currentline.size() != 0 : newGrid.append(currentline)
	savegame.close()
	return newGrid