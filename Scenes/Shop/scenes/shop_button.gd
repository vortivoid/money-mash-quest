extends Button
@export var item = Resource

func _on_pressed() -> void:
	if Globals.money >= Globals.mouseSteroidsPrice:
		Globals.money -= Globals.mouseSteroidsPrice
		Globals.mouseSteroidsOwned += 1
		$PurchaseSFX.play()
