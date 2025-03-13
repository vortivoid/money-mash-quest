extends Control


func _on_office_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Office/office.tscn")


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop/shop.tscn")


func _on_casino_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Casino/casino.tscn")
