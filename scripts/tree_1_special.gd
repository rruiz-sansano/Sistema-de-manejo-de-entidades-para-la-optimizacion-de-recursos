extends Node3D


func _ready():
	if !Global.hlod:
		$CloseMesh/tree_002.visibility_range_end = 0.0
