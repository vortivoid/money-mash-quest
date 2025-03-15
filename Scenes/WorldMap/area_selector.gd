extends OptionButton

var currentarea = self.selected

func _on_item_selected(index: int) -> void:
	if index == 0:
		$"..".switch_area(currentarea, $"../GrasslandMap")
	elif index == 1:
		pass
	elif index == 2:
		pass
	elif index == 3:
		pass
