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
	if Globals.money >= Globals.mouseSteroidsPrice:
		Globals.money -= Globals.mouseSteroidsPrice
		Globals.mouseSteroidsOwned += 1
		
func _on_buy_max_mousesteroids_pressed():
	while Globals.money >= Globals.mouseSteroidsPrice:
		_on_mouse_steroids_pressed()


#Auto-Clicker
func _on_auto_clicker_pressed():
	if Globals.money >= Globals.autoClickersPrice:
		Globals.money -= Globals.autoClickersPrice
		Globals.autoClickersOwned += 1

func _on_buy_max_autoclicker_pressed():
	while Globals.money >= Globals.autoClickersPrice:
		_on_auto_clicker_pressed()


## Updates all important variables in the shop, & updates Globals variables
func UpdateShop():
	# Update item prices
	Globals.mouseSteroidsPrice = 150 * (Globals.mouseSteroidsOwned + 1)
	Globals.autoClickersPrice = 25 * (Globals.autoClickersOwned + 1)
	
	#Coin Display
	$CoinIcon/CoinCount.text = str(Globals.money)
	
	#Owned Number Labels
	$MouseSteroids/OwnedNumLabel.text = str("Have: " + str(Globals.mouseSteroidsOwned))
	$AutoClicker/OwnedNumLabel.text = str("Have: " + str(Globals.autoClickersOwned))
	
	#Price Labels
	$MouseSteroids/CoinIcon/ItemCost.text = str(Globals.mouseSteroidsPrice)
	$AutoClicker/CoinIcon/ItemCost.text = str(Globals.autoClickersPrice)


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
