extends Node

var current_scene: Node = null



#func switch_scene(new_scene_path: String) -> void:
	#var new_scene_resource: PackedScene = load(new_scene_path)
	#if new_scene_resource == null:
		#push_error("Failed to load scene: " + new_scene_path)
		#return
	#
	#var new_scene_instance: Node = new_scene_resource.instantiate()
	#
	#if current_scene:
		#remove_child(current_scene)
		#current_scene.queue_free()
	#
	#add_child(new_scene_instance)
	#
	#current_scene = new_scene_instance
