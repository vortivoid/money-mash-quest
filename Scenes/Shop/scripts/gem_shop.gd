extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateShop()


## Shop Items ##
# Auto-Clicker
func _on_auto_clicker_upgrade_pressed():
	if Globals.gems >= Globals.autoClickerUpgradePrice:
		Globals.gems -= Globals.autoClickerUpgradePrice
		Globals.autoClickerUpgradeOwned = true
		$PurchaseSFX.play()

func _on_plane_pressed():
	if Globals.planeOwned == true:
		print("You already own this item!")
	else:
		if Globals.gems >= Globals.planePrice:
			Globals.gems -= Globals.planePrice
			Globals.planeOwned = true
			UpdateShop()
			$PurchaseSFX.play()

func _on_mouse_steroids_upgrade_button_pressed():
	if Globals.gems >= Globals.mouseSteroidsUpgradePrice:
		Globals.gems -= Globals.mouseSteroidsUpgradePrice
		Globals.mouseSteroidsUpgradeOwned = true
		$PurchaseSFX.play()

func _on_gun_pressed():
	if Globals.gunOwned == true:
		print("You already own this item!")
	else:
		if Globals.gems >= Globals.gunPrice:
			Globals.gems -= Globals.gunPrice
			Globals.gunOwned = true
			$PurchaseSFX.play()

## Other stuff
func UpdateShop(): ### Updates all important variables in the shop such as labels displaying item costs ###
	if Globals.mouseSteroidsUpgradeOwned:
		$MouseSteroidsUpgradeButton.disabled = true
		$MouseSteroidsUpgradeButton/GemIcon/ItemCost.text = "Owned!"
	else:

		$MouseSteroidsUpgradeButton/GemIcon/ItemCost.text = str(Globals.mouseSteroidsUpgradePrice)
	if Globals.autoClickerUpgradeOwned:
		$AutoClickerUpgrade.disabled = true
		$AutoClickerUpgrade/GemIcon/ItemCost.text = "Owned!"
	else:
		$AutoClickerUpgrade/GemIcon/ItemCost.text = str(Globals.autoClickerUpgradePrice)

	if Globals.gunOwned:
		$Gun.disabled = true
		$Gun/GemIcon/ItemCost.text = "Owned!"
	else:
		$Gun/GemIcon/ItemCost.text = str(Globals.gunPrice)

	if Globals.planeOwned:
		$Plane.disabled = true
		$Plane/GemIcon/ItemCost.text = "Owned!"
	else:
		$Plane/GemIcon/ItemCost.text = str(Globals.planePrice)
		
	$GemIcon/GemCount.text = str(Globals.gems)



func _on_coin_shop_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop/scenes/shop.tscn")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
