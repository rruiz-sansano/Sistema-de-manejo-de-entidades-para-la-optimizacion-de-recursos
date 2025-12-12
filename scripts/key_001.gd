extends MeshInstance3D


func _on_area_3d_body_entered(_body):
	Global.pickup = true
	$".".queue_free()
