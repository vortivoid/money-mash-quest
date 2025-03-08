extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateShop()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")

func _on_gem_shop_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Shop/gem_shop.tscn")

#Mouse Steroids
func _on_mouse_steroids_pressed():
	if CoreInfo.money >= CoreInfo.mouseSteroidsPrice:
		CoreInfo.money -= CoreInfo.mouseSteroidsPrice
		CoreInfo.mouseSteroidsOwned += 1
		
func _on_buy_max_mousesteroids_pressed():
	while CoreInfo.money >= CoreInfo.mouseSteroidsPrice:
		_on_mouse_steroids_pressed()


#Auto-Clicker
func _on_auto_clicker_pressed():
	if CoreInfo.money >= CoreInfo.autoClickersPrice:
		CoreInfo.money -= CoreInfo.autoClickersPrice
		CoreInfo.autoClickersOwned += 1

func _on_buy_max_autoclicker_pressed():
	while CoreInfo.money >= CoreInfo.autoClickersPrice:
		_on_auto_clicker_pressed()


## Updates all important variables in the shop, & updates CoreInfo variables
func UpdateShop():
	# Update item prices
	CoreInfo.mouseSteroidsPrice = 150 * (CoreInfo.mouseSteroidsOwned + 1)
	CoreInfo.autoClickersPrice = 25 * (CoreInfo.autoClickersOwned + 1)
	
	#Coin Display
	$CoinIcon/CoinCount.text = str(CoreInfo.money)
	
	#Owned Number Labels
	$MouseSteroids/OwnedNumLabel.text = str("Have: " + str(CoreInfo.mouseSteroidsOwned))
	$AutoClicker/OwnedNumLabel.text = str("Have: " + str(CoreInfo.autoClickersOwned))
	
	#Price Labels
	$MouseSteroids/CoinIcon/ItemCost.text = str(CoreInfo.mouseSteroidsPrice)
	$AutoClicker/CoinIcon/ItemCost.text = str(CoreInfo.autoClickersPrice)
