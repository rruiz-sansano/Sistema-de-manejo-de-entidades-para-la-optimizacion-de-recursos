extends Control


func _ready():
	%"Occlussion culling".button_pressed = Global.oc_culling
	%HLOD.button_pressed = Global.hlod
	%"Object pooling".button_pressed = Global.obj_pool
	%"Chunk".button_pressed = Global.chunk

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_occlussion_culling_toggled(toggled_on):
	Global.oc_culling = toggled_on
	if toggled_on:
		get_tree().root.use_occlusion_culling = true
	else:
		get_tree().root.use_occlusion_culling = false


func _on_hlod_toggled(toggled_on):
	Global.hlod = toggled_on


func _on_object_pooling_toggled(toggled_on):
	Global.obj_pool = toggled_on


func _on_chunk_toggled(toggled_on):
	Global.chunk = toggled_on


func _on_play_oc_pressed():
	if Global.oc_culling:
		Global.next_scene = "res://scenes/world_oc.tscn"
	else:
		Global.next_scene = "res://scenes/world_oc_normal.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _on_play_hlod_pressed():
	Global.next_scene = "res://scenes/world_lod.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _on_play_op_pressed():
	Global.next_scene = "res://scenes/world_op.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _on_play_chunk_pressed():
	if Global.chunk:
		Global.next_scene = "res://scenes/world_chunk.tscn"
	else:
		Global.next_scene = "res://scenes/world_chunk_normal.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _input(event):
	if event.is_action_pressed("Fullscreen"):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)
