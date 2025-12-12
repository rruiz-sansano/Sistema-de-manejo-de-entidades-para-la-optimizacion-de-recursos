extends Node3D


func _ready():
	if !Global.hlod:
		$CloseMesh/tree2OakHigh_001.visibility_range_end = 0.0
