extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var errorLabel = $Text
	if Label:
		errorLabel.text = ("WARNING!\n\nYour existing save file is from version " + CoreInfo.oldSaveVersion + " but you are running version " + CoreInfo.gameVer + "\n\nMoney Mash Quest is still in alpha and issues are likely to arise between updates. It is reccomended that you delete your old save.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_continue_pressed() -> void:
	$"../..".startgame()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_reset_pressed() -> void:
	CoreInfo.deletesave()
	$"../..".startgame()
