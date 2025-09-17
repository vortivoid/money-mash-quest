extends Control

# Begin Game
func _on_start_button_pressed() -> void:
	$ButtonClickSFX.play()
	Globals.autosave_disabled = true
	print("Disabled autosave during save check!")
	print("Running Save Check...")
	Globals.savecheck()


# Delete Save Menu
func _on_delete_save_button_pressed() -> void:
	$DeleteSaveConfirm.visible = true
	$ButtonClickSFX.play()
	
func _on_confirm_pressed() -> void:
	Globals.deletesave()
	$DeleteSaveConfirm.visible = false
	$ButtonClickSFX.play()
	
func _on_cancel_pressed() -> void:
	$DeleteSaveConfirm.visible = false
	$ButtonClickSFX.play()


# Options Menu
func _on_options_button_pressed() -> void:
	$OptionsMenu.visible = true
	$ButtonClickSFX.play()

func _on_change_name_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/name_select.tscn")
	$ButtonClickSFX.play()

func _on_done_button_pressed() -> void:
	$OptionsMenu.visible = false
	$ButtonClickSFX.play()


# Loop audio
func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()


func _on_credits_button_pressed() -> void:
	$Credits.visible = true
	$ButtonClickSFX.play()

func _on_credits_done_button_pressed() -> void:
	$Credits.visible = false
	$ButtonClickSFX.play()
