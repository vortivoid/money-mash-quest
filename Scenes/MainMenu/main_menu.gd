extends Control


func _on_start_button_pressed() -> void:
	Globals.autosave_disabled = true
	print("Disabled autosave during save check!")
	print("Running Save Check...")
	Globals.savecheck()


func _on_delete_save_button_pressed() -> void:
	$DeleteSaveConfirm.visible = true


func _on_confirm_pressed() -> void:
	Globals.deletesave()
	$DeleteSaveConfirm.visible = false


func _on_cancel_pressed() -> void:
	$DeleteSaveConfirm.visible = false
