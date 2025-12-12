extends Node3D


func _on_end_body_entered(_body):
	var file1 = FileAccess.open("user://oc_fps_data.csv", FileAccess.WRITE)
	file1.store_string(Global.fps_data)
	file1.close()
	var file2 = FileAccess.open("user://oc_ent_data.csv", FileAccess.WRITE)
	file2.store_string(Global.ent_data)
	file2.close()
	var file3 = FileAccess.open("user://oc_draw_data.csv", FileAccess.WRITE)
	file3.store_string(Global.draw_data)
	file3.close()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Global.entities = 0
	Global.targets = 0
	get_tree().call_deferred("change_scene_to_file", "res://scenes/menu.tscn")
