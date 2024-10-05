extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateShop()


## Shop Items ##
# Auto-Clicker
func _on_auto_clicker_upgrade_pressed():
	if CoreInfo.gems >= CoreInfo.autoClickerUpgradePrice:
		CoreInfo.gems -= CoreInfo.autoClickerUpgradePrice
		CoreInfo.AutoClickerUpgradeOwned = true
	else:
		pass # Put a text thingy here lol


func _on_plane_pressed():
	if CoreInfo.planeOwned == true:
		print("You already own this item!")
	else:
		if CoreInfo.gems >= CoreInfo.planePrice:
			CoreInfo.gems -= CoreInfo.planePrice
			CoreInfo.planeOwned = true
			UpdateShop()

func _on_mouse_steroids_upgrade_button_pressed():
	if CoreInfo.gems >= CoreInfo.mouseSteroidsUpgradePrice:
		CoreInfo.gems -= CoreInfo.mouseSteroidsUpgradePrice
		CoreInfo.MouseSteroidsUpgradeOwned = true
	else:
		pass # Put a text thingy here too :3

func _on_gun_pressed():
	if CoreInfo.gunOwned == true:
		print("You already own this item!")
	else:
		if CoreInfo.gems >= CoreInfo.gunPrice:
			CoreInfo.gems -= CoreInfo.gunPrice
			CoreInfo.gunOwned = true

## Other stuff
func UpdateShop(): ### Updates all important variables in the shop such as labels displaying item costs ###
	if CoreInfo.MouseSteroidsUpgradeOwned:
		$MouseSteroidsUpgradeButton.disabled = true
		$MouseSteroidsUpgradeButton/GemIcon/ItemCost.text = "Owned!"
	else:

		$MouseSteroidsUpgradeButton/GemIcon/ItemCost.text = str(CoreInfo.mouseSteroidsUpgradePrice)
	if CoreInfo.AutoClickerUpgradeOwned:
		$AutoClickerUpgrade.disabled = true
		$AutoClickerUpgrade/GemIcon/ItemCost.text = "Owned!"
	else:
		$AutoClickerUpgrade/GemIcon/ItemCost.text = str(CoreInfo.autoClickerUpgradePrice)

	if CoreInfo.gunOwned:
		$Gun.disabled = true
		$Gun/GemIcon/ItemCost.text = "Owned!"
	else:
		$Gun/GemIcon/ItemCost.text = str(CoreInfo.gunPrice)

	if CoreInfo.planeOwned:
		$Plane.disabled = true
		$Plane/GemIcon/ItemCost.text = "Owned!"
	else:
		$Plane/GemIcon/ItemCost.text = str(CoreInfo.planePrice)
		
	$GemIcon/GemCount.text = str(CoreInfo.gems)



func _on_coin_shop_button_pressed():
	$"../../ShopCamera".make_current()

func _on_back_button_pressed():
	get_tree().call_group("maincam", "switch")
	$"../..".UpdateValues()
