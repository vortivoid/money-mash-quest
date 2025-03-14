extends Control


func _on_button_pressed() -> void:
	Globals.playerName = $LineEdit.text
	Globals.startgame()
