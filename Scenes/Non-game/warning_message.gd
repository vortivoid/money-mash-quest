extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var errorLabel = $Text
	if Label:
		errorLabel.text = ("WARNING!\n\nYour existing save file is from version " + Globals.oldSaveVersion + " but you are running version " + Globals.gameVer + "\n\nMoney Mash Quest is still in alpha and issues are likely to arise between updates. It is reccomended that you delete your old save.")


func _on_continue_pressed() -> void:
	Globals.startgame()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_reset_pressed() -> void:
	Globals.deletesave()
	Globals.startgame()
