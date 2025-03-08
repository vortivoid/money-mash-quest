extends Node

var current_scene: Node = null

func _ready():
	Globals.autosave_disabled = true
	savecheck()

func savecheck():
	if FileAccess.file_exists(Globals.save_path):
		var savefile = FileAccess.open(Globals.save_path, FileAccess.READ)
		
		# Load the dictionary from the file
		var game_data = savefile.get_var()
		savefile.close()
	
		# Check for stored gameVer
		if savefile:
			var oldVer = game_data.get("gameVer", "")
			if oldVer is String and "." in oldVer:
				pass
			else:
				oldVer = "(Cannot detect verion! Likely Alpha 1.4.0 or earlier)"
			
			# If gameVer found, check if it matches the current gameVer, and perform action based on result
			if oldVer == Globals.gameVer:
				startgame()
			else:
				Globals.oldSaveVersion = oldVer
				get_tree().change_scene_to_file("res://Scenes/Non-game/warning_message.tscn")
		else:
			print("No save file detected!")
			startgame()

func startgame():
	get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")
	Globals.loadsave()
	Globals.autosave_disabled = false


#func switch_scene(new_scene_path: String) -> void:
	#var new_scene_resource: PackedScene = load(new_scene_path)
	#if new_scene_resource == null:
		#push_error("Failed to load scene: " + new_scene_path)
		#return
	#
	#var new_scene_instance: Node = new_scene_resource.instantiate()
	#
	#if current_scene:
		#remove_child(current_scene)
		#current_scene.queue_free()
	#
	#add_child(new_scene_instance)
	#
	#current_scene = new_scene_instance

#Timers
func _on_autosave_timeout() -> void:
	Globals.save()
	print("Autosave complete!")
	$AutosaveTimer.start()

#Autoclicker Timer
func _on_auto_click_timer_timeout():
	if Globals.autoClickersOwned >= 1:
		doautoclick()
		$AutoClickTimer.wait_time = float(1.0 / float(Globals.autoClickersOwned))
		

func doautoclick():
	if Globals.AutoClickerUpgradeOwned:
		if Globals.mouseSteroidsOwned == 0:
			Globals.money += 1
		else:
			if Globals.MouseSteroidsUpgradeOwned:
				Globals.money += ((Globals.MouseSteroidsOwned + 1) * 2)
			else:
				Globals.money += (Globals.mouseSteroidsOwned + 1)
	else:
		Globals.money += 1
