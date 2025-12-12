extends Control

func _ready():
	%"Occlussion culling".button_pressed = Global.oc_culling
	%LOD.button_pressed = Global.lod
	%"Static LOD".button_pressed = Global.static_lod
	%"Object pooling".button_pressed = Global.obj_pool
	%"Entity data management".button_pressed = Global.edm


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_occlussion_culling_toggled(toggled_on):
	Global.oc_culling = toggled_on
	if toggled_on:
		get_tree().root.use_occlusion_culling = true
	else:
		get_tree().root.use_occlusion_culling = false


func _on_lod_toggled(toggled_on):
	Global.lod = toggled_on
	if toggled_on and %"Static LOD".button_pressed:
		%"Static LOD".button_pressed = false


func _on_object_pooling_toggled(toggled_on):
	Global.obj_pool = toggled_on


func _on_entity_data_management_toggled(toggled_on):
	Global.edm = toggled_on


func _on_static_lod_toggled(toggled_on):
	Global.static_lod = toggled_on
	if toggled_on and %LOD.button_pressed:
		%LOD.button_pressed = false
