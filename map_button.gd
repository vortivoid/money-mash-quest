extends Node
@export var location: PackedScene
var default_scale: Vector2


func _ready() -> void:
	default_scale = self.scale
	connect("pressed", Callable(self, "_on_pressed"))
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "on_mouse_exited"))
	connect("button_down", Callable(self, "on_button_down"))
	
func _on_pressed() -> void:
	if location:
		get_tree().change_scene_to_packed(location)


# Button Scaling
func _on_button_down() -> void:
	self.scale = default_scale * 0.8
	
func _on_mouse_entered() -> void:
	self.scale = default_scale * 1.2
	
func _on_mouse_exited() -> void:
	self.scale = default_scale
