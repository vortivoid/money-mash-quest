### This script stores all the info in the game that should be saved when saving the game, as well as storing values for other scripts to access ###
extends Node

### TESTING NEW ITEM MANAGEMENT SYSTEM!!
var items = {
	"autoclicker": preload("res://Items/Autoclicker.tres")
}

var item_counts = {
	"autoclicker": 0
}


var gameVer = "Alpha 1.9.0"
const save_path = "user://save.data"
var autosave_disabled = false

## Save file variables (Values are just defaults and are replaced by contents of save file on load) ##
# Main
var money: int = 0
var gems: int = 0
var totalCoinsEver: int = 0
var playerName: String = "playerName"

# Old Save Info
var oldSaveVersion = ""

func save():
	var savefile = FileAccess.open(save_path, FileAccess.WRITE)
	
	# Create a dictionary to store game data
	var game_data = {
		"gameVer": gameVer,
		"money": money,
		"gems": gems,
		"totalCoinsEver": totalCoinsEver,
		"playerName": playerName,
		"items_owned": {}
	}
	
	# Store the entire dictionary in the save file
	savefile.store_var(game_data)
	
	# Store a secret message
	savefile.store_string("Why are you here, Huh? Lil cheeky punk, you tryna cheat??? That's kinda cringe bro buddy buster.")
	savefile.close()


func loadsave():
	if FileAccess.file_exists(save_path):
		var savefile = FileAccess.open(save_path, FileAccess.READ)
		
		# Load the dictionary from the file
		var game_data = savefile.get_var()
		
		# Main
		money = game_data.get("money", 0)
		gems = game_data.get("gems", 0)
		totalCoinsEver = game_data.get("totalCoinsEver", 0)
		playerName = game_data.get("playerName", "playerName")
		
		savefile.close()
	
func deletesave():
	DirAccess.remove_absolute(save_path)

func savecheck():
	print("Checking for existing save file...")
	if FileAccess.file_exists(save_path):
		print("File found!")
		var savefile = FileAccess.open(save_path, FileAccess.READ)
		
		# Load the dictionary from the file
		var game_data = savefile.get_var()
		savefile.close()
		print("Save Data Loaded!")
	
		# Check for stored gameVer
		if savefile:
			var oldVer = game_data.get("gameVer", "")
			if oldVer is String and "." in oldVer:
				pass
				print("Valid version detected in save file: " + str(oldVer))
			else:
				oldVer = "(Cannot detect verion! Likely Alpha 1.4.0 or earlier)"
				print("No version variable found in save file. This probably indicates the save is from alpha 1.4.0 or earlier.")
				
			# If gameVer found, check if it matches the current gameVer, and perform action based on result
			if oldVer == gameVer:
				print("Save file version matches current game version.")
				startgame()
			else:
				print("Save file version does not match current game version.")
				oldSaveVersion = oldVer
				get_tree().change_scene_to_file("res://Scenes/Non-game/warning_message.tscn")
				print("Loaded warning message scene.")
	else:
		print("No save file detected!")
		get_tree().change_scene_to_file("res://Scenes/name_select.tscn")

func startgame():
	print("Starting game with detected save data: " +playerName)
	get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")
	loadsave()
	autosave_disabled = false
	print("Autosave re-enabled!")
