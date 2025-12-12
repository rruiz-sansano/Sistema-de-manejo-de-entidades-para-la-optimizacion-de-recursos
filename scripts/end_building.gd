extends Node3D


func _ready():
	if !Global.hlod:
		%MidMesh.queue_free()
		$CloseMesh/Floor.visibility_range_end = 0.0
		$CloseMesh/Ceiling.visibility_range_end = 0.0
		$CloseMesh/pillar.visibility_range_end = 0.0
		$CloseMesh/pillar2.visibility_range_end = 0.0
		$CloseMesh/pillar3.visibility_range_end = 0.0
		$CloseMesh/pillar4.visibility_range_end = 0.0
		$"CloseMesh/Chest/chest's gold".visibility_range_end = 0.0
		$"CloseMesh/Chest/chest bottom".visibility_range_end = 0.0
		$"CloseMesh/Chest/chest top".visibility_range_end = 0.0


func _on_area_3d_body_entered(_body):
	var file1 = FileAccess.open("user://hlod_fps_data.csv", FileAccess.WRITE)
	file1.store_string(Global.fps_data)
	file1.close()
	var file2 = FileAccess.open("user://hlod_ent_data.csv", FileAccess.WRITE)
	file2.store_string(Global.ent_data)
	file2.close()
	var file3 = FileAccess.open("user://hlod_draw_data.csv", FileAccess.WRITE)
	file3.store_string(Global.draw_data)
	file3.close()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Global.entities = 0
	Global.targets = 0
	get_tree().call_deferred("change_scene_to_file", "res://scenes/menu.tscn")
