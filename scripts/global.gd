extends Node

#optimizaciones
var oc_culling = false
var hlod = false
var static_lod = false
var obj_pool = false
var chunk = false

#gameplay
var targets = 0
var entities = 0
var debug = 0
var pickup = false
var exit = false
var fps_data = ""
var ent_data = ""
var draw_data = ""
var next_scene = ""

func _ready():
	if !oc_culling:
		get_tree().root.use_occlusion_culling = false
