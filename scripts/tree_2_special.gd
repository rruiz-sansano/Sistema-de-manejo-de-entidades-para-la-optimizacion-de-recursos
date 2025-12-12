extends Node3D


func _ready():
	if !Global.hlod:
		$CloseMesh/Tree4Dupe.visibility_range_end = 0.0
