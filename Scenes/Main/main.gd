extends Control
const defaultmousepower = 1




# Called when the node enters the scene tree for the first time.
func _ready():
	CoreInfo.autosave_disabled = true
	savecheck()
	$DiscordRPCUpdateTimer.start()
	$DiscordRPCUpdateTimer/DiscordRPC.updateRPC()

func startgame():
	#Sets camera and plays background animation
	CoreInfo.loadsave()
	$MainCamera.make_current()
	UpdateValues()
	$AutoClickTimer.start()
	$AutosaveTimer.start()
	CoreInfo.autosave_disabled = false

func _process(_delta):
		pass


func savecheck():
	if FileAccess.file_exists(CoreInfo.save_path):
		var savefile = FileAccess.open(CoreInfo.save_path, FileAccess.READ)
		
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
			if oldVer == CoreInfo.gameVer:
				pass
				startgame()
			else:
				var errorLabel = $WarningMessageCam/WarningMessage.get_node("Text")
				if Label:
					errorLabel.text = ("WARNING!\n\nYour existing save file is from version " + oldVer + " but you are running version " + CoreInfo.gameVer + "\n\nMoney Mash Quest is still in alpha and issues are likely to arise between updates. It is reccomended that you delete your old save.")
				$WarningMessageCam.make_current()
		else:
			print("No save file detected!")
			pass
			startgame()


#Function that runs when the main button is clicked
func _on_main_button_pressed():
	doclick()


func doclick():
	#Increases coin count based on how many mouse steroids are owned
	if CoreInfo.mouseSteroidsOwned == 0:
		CoreInfo.coins += defaultmousepower
	else:
		if CoreInfo.MouseSteroidsUpgradeOwned:
			CoreInfo.coins += ((CoreInfo.MouseSteroidsOwned + 1) * 2)
		else:
			CoreInfo.coins += (CoreInfo.mouseSteroidsOwned + 1)
	UpdateValues()
	
	#Plays audio cue
	$MainCamera/"Main Button/AudioStreamPlayer2D".play()


#Autoclicker Timer
func _on_auto_click_timer_timeout():
	if CoreInfo.autoClickersOwned >= 1:
		doautoclick()
		$AutoClickTimer.wait_time = float(1.0 / float(CoreInfo.autoClickersOwned))
		

func doautoclick():
	if CoreInfo.AutoClickerUpgradeOwned:
		doclick()
	else:
		CoreInfo.coins += 1
	UpdateValues()


#Funny epic funny prank haha funny button clicked (defo not a rickroll)
func _on_secret_button_pressed():
	OS.shell_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ")


#Save button clicked
func _on_save_data_pressed():
	CoreInfo.save()


func UpdateValues():
	$MainCamera/CoinDisplay/CoinCounter.text = str(CoreInfo.coins)
	if int(CoreInfo.coins) == 0:
		$MainCamera/CoinDisplay/CoinCounter.text = "0 (broke ass 💀)"

#Shop button clicked
func _on_shop_button_pressed():
	$ShopCamera.make_current()
	$ShopCamera/Shop.UpdateShop()



func _on_casino_button_pressed() -> void:
	$CasinoCamera.make_current()
	$CasinoCamera/casino.UpdateLabels()


func _on_autosave_timeout() -> void:
	CoreInfo.save()
	print("Autosave complete!")
	$AutosaveTimer.start()


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
