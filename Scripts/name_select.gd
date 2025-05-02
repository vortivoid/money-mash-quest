extends Control


func _on_button_pressed() -> void:
	Globals.playerName = $LineEdit.text
	if Globals.playerName.to_lower() == "beans":
		Globals.money += 1000000
		Globals.gems += 1000000
	else:
		pass
	Globals.save()
	Globals.startgame()
