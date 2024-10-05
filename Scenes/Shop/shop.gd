extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateShop()


func _on_back_button_pressed():
	get_tree().call_group("maincam", "switch")
	$"../..".UpdateValues()

func _on_gem_shop_button_pressed():
	$"../../GemShopCam".make_current()

#Mouse Steroids
func _on_mouse_steroids_pressed():
	if CoreInfo.coins >= CoreInfo.mouseSteroidsPrice: #Checks if you have enough coins to purchase the mouse steroids
		CoreInfo.coins -= CoreInfo.mouseSteroidsPrice #Subtracts your money to match whatever the price was
		CoreInfo.mouseSteroidsOwned += 1
		
func _on_buy_max_mousesteroids_pressed():
	while CoreInfo.coins >= CoreInfo.mouseSteroidsPrice:
		_on_mouse_steroids_pressed()


#Auto-Clicker
func _on_auto_clicker_pressed():
	if CoreInfo.coins >= CoreInfo.autoClickersPrice:
		CoreInfo.coins -= CoreInfo.autoClickersPrice
		CoreInfo.autoClickersOwned += 1

func _on_buy_max_autoclicker_pressed():
	while CoreInfo.coins >= CoreInfo.autoClickersPrice:
		_on_auto_clicker_pressed()


## Updates all important variables in the shop, & updates CoreInfo variables
func UpdateShop():
	# Update item prices
	CoreInfo.mouseSteroidsPrice = 100 * (CoreInfo.mouseSteroidsOwned + 1)
	CoreInfo.autoClickersPrice = 50 * (CoreInfo.autoClickersOwned + 1)
	
	#Coin Display
	$CoinIcon/CoinCount.text = str(CoreInfo.coins)
	
	#Owned Number Labels
	$MouseSteroids/OwnedNumLabel.text = str("Have: " + str(CoreInfo.mouseSteroidsOwned))
	$AutoClicker/OwnedNumLabel.text = str("Have: " + str(CoreInfo.autoClickersOwned))
	
	#Price Labels
	$MouseSteroids/CoinIcon/ItemCost.text = str(CoreInfo.mouseSteroidsPrice)
	$AutoClicker/CoinIcon/ItemCost.text = str(CoreInfo.autoClickersPrice)
