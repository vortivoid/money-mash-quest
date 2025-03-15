extends Control

var maps: Array
var current_map: Node = null

func _ready() -> void:
	maps = [
		$GrasslandMap,
		$SandlandMap,
		$SnowlandMap,
		$MoonMap
	]
	for map in maps:
		map.visible = false

func _on_area_selector_item_selected(index: int) -> void:
	if current_map:
		current_map.visible = false
		
	current_map = maps[index]
	current_map.visible = true

# Music loop
func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
