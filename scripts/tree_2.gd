extends Node3D


func _ready():
	if !Global.hlod:
		%MidMesh.queue_free()
		%FarMesh.queue_free()
		%CloseMesh/Tree4Dupe.visibility_range_end = 0.0
