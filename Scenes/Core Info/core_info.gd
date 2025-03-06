### This script stores all the info in the game that should be saved when saving the game, as well as storing values for other scripts to access ###
extends Node
var gameVer = "Alpha 1.6.4"
const save_path = "user://save.data"

## Saved variables (Values are just defaults and are replaced by contents of save file on load) ##
# Main
var coins = 0
var gems = 0

# Coin Shop Items
var mouseSteroidsOwned = 0
var autoClickersOwned = 0

# Coin Shop Prices
var mouseSteroidsPrice = 150
var autoClickersPrice = 25

# Gem Shop Items
var MouseSteroidsUpgradeOwned = false
var AutoClickerUpgradeOwned = false
var planeOwned = false
var gunOwned = false

# Gem Shop Prices
var mouseSteroidsUpgradePrice = 200
var autoClickerUpgradePrice = 500
var planePrice = 300
var gunPrice = 100


func save():
	var savefile = FileAccess.open(save_path, FileAccess.WRITE)
	
	# Create a dictionary to store game data
	var game_data = {
		"gameVer": gameVer,
		"coins": coins,
		"gems": gems,
		"items_owned": {
			"mouseSteroidsOwned": mouseSteroidsOwned,
			"autoClickersOwned": autoClickersOwned,
			"planeOwned": planeOwned,
			"gunOwned": gunOwned,
		}
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
		coins = game_data.get("coins", 0)
		gems = game_data.get("gems", 0)
		
		# Items Owned (stored in a nested dictionary)
		var items_owned = game_data.get("items_owned", {})
		mouseSteroidsOwned = items_owned.get("mouseSteroidsOwned", 0)
		autoClickersOwned = items_owned.get("autoClickersOwned", 0)
		planeOwned = items_owned.get("planeOwned", false)
		gunOwned = items_owned.get("gunOwned", false)
		
		savefile.close()
