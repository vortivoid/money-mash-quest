extends Control


func _ready() -> void:
	$MainCamera.make_current()
	UpdateValues()
	$PlayerBankText.text = str(Globals.playerName) + "'s Bank"
	
func _process(_delta: float) -> void:
	UpdateValues()


func doclick():
	#Increases coin count based on how many mouse steroids are owned
	if Globals.mouseSteroidsOwned == 0:
		Globals.money += 1
		#If player has mouse steroids, checks if they have the mouse steroids upgrade, if so then doubles the output
	else:
		if Globals.MouseSteroidsUpgradeOwned == true:
			Globals.money += ((Globals.mouseSteroidsOwned + 1) * 2)
		else:
			Globals.money += (Globals.mouseSteroidsOwned + 1)
	
	#Plays audio cue
	$MainCamera/"Main Button/AudioStreamPlayer2D".play()


#Function that runs when the main button is clicked
func _on_main_button_pressed():
	doclick()


#Funny epic funny prank haha funny button clicked (defo not a rickroll)
func _on_secret_button_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")


#Save button clicked
func _on_save_data_pressed():
	Globals.save()
	$MainCamera/SaveData/Label.visible = true
	$MainCamera/SaveData/savetexttime.start()



func UpdateValues():
	$MainCamera/CoinDisplay/CoinCounter.text = str(Globals.money)
	if int(Globals.money) == 0:
		$MainCamera/CoinDisplay/CoinCounter.text = "0 (broke ass 💀)"

#Shop button clicked
func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")


func _on_main_button_mouse_entered() -> void:
	$"MainCamera/Main Button".scale += Vector2(0.2, 0.2)


func _on_main_button_mouse_exited() -> void:
	$"MainCamera/Main Button".scale -= Vector2(0.2, 0.2)


func _on_main_button_button_down() -> void:
	$"MainCamera/Main Button".scale -= Vector2(0.2, 0.2)


func _on_main_button_button_up() -> void:
	$"MainCamera/Main Button".scale += Vector2(0.2, 0.2)


func _on_discord_rpc_update_timer_timeout():
	$DiscordRPCUpdateTimer/DiscordRPC.updateRPC()
	$DiscordRPCUpdateTimer.start(5.0)

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
				Globals.money += ((Globals.mouseSteroidsOwned + 1) * 2)
			else:
				Globals.money += (Globals.mouseSteroidsOwned + 1)
	else:
		Globals.money += 1


func _on_autosave_timer_timeout() -> void:
	Globals.save()
	$MainCamera/SaveData/Label.visible = true
	$MainCamera/SaveData/savetexttime.start()
	print("Autosave complete!")
	$AutosaveTimer.start()


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()


func _on_savetexttime_timeout() -> void:
	$MainCamera/SaveData/Label.visible = false


func _on_main_menu_button_pressed() -> void:
	Globals.save()
	get_tree().change_scene_to_file("res://Scenes/MainMenu/main_menu.tscn")
