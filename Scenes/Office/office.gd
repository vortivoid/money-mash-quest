extends Control


func _ready() -> void:
	$MainCamera.make_current()
	UpdateValues()

func _process(_delta: float) -> void:
	UpdateValues()


func doclick():
	#Increases coin count based on how many mouse steroids are owned
	if CoreInfo.mouseSteroidsOwned == 0:
		CoreInfo.money += 1
	else:
		if CoreInfo.MouseSteroidsUpgradeOwned:
			CoreInfo.money += ((CoreInfo.MouseSteroidsOwned + 1) * 2)
		else:
			CoreInfo.money += (CoreInfo.mouseSteroidsOwned + 1)
	
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
	CoreInfo.save()


func UpdateValues():
	$MainCamera/CoinDisplay/CoinCounter.text = str(CoreInfo.money)
	if int(CoreInfo.money) == 0:
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
