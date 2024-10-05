extends Control

func _process(_delta: float) -> void:
	UpdateLabels()

func UpdateLabels():
	$CoinIcon/CoinCount.text = str(CoreInfo.coins)

func _on_back_button_pressed() -> void:
		get_tree().call_group("maincam", "switch")
		$"../..".UpdateValues()
		$ResultText.visible = false
