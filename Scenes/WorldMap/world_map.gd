extends Control


func _on_office_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Office/office.tscn")


func _on_shop_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Shop/shop.tscn")


func _on_casino_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Casino/casino.tscn")


#Button Scaling


func _on_office_button_mouse_entered() -> void:
	$"Mmq-map/OfficeButton".scale += Vector2(0.2, 0.2)


func _on_office_button_mouse_exited() -> void:
	$"Mmq-map/OfficeButton".scale -= Vector2(0.2, 0.2)


func _on_shop_button_mouse_entered() -> void:
	$"Mmq-map/ShopButton".scale += Vector2(0.2, 0.2)


func _on_shop_button_mouse_exited() -> void:
	$"Mmq-map/ShopButton".scale -= Vector2(0.2, 0.2)


func _on_casino_button_mouse_entered() -> void:
	$"Mmq-map/CasinoButton".scale += Vector2(0.2, 0.2)


func _on_casino_button_mouse_exited() -> void:
	$"Mmq-map/CasinoButton".scale -= Vector2(0.2, 0.2)


func _on_office_button_button_down() -> void:
	$"Mmq-map/OfficeButton".scale -= Vector2(0.2, 0.2)


func _on_shop_button_button_down() -> void:
	$"Mmq-map/ShopButton".scale -= Vector2(0.2, 0.2)


func _on_casino_button_button_down() -> void:
	$"Mmq-map/CasinoButton".scale -= Vector2(0.2, 0.2)
