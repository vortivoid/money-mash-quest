extends Control

func _process(_delta: float) -> void:
	UpdateLabels()

func UpdateLabels():
	$CoinIcon/CoinCount.text = str(Globals.money)

func _on_back_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/WorldMap/world_map.tscn")
		$ResultText.visible = false


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
