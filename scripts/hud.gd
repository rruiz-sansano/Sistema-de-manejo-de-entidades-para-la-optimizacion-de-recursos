extends Control

var fps : Label
var entities : Label
var drawcalls : Label
var time : float = 0.0
var frames := 0
# var cpu : Label
# var gpu : Label

func _ready():
	fps = $FPS
	entities = $Entities
	drawcalls = $DrawCalls
	Global.fps_data = ""
	Global.ent_data = ""
	Global.draw_data = ""
	# cpu = $CPU
	# gpu = $GPU

func _process(delta):
	time += delta
	frames += 1
	entities.set_text("Entities: %d" % Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
	drawcalls.set_text("Drawcalls: %d" % Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
	
	if time >= 1.0:
		fps.set_text("FPS: %d" % Performance.get_monitor(Performance.TIME_FPS))
		
		if Global.fps_data == "":
			Global.fps_data = str(Performance.get_monitor(Performance.TIME_FPS))
		else:
			Global.fps_data = Global.fps_data + "," + str(Performance.get_monitor(Performance.TIME_FPS))
		if Global.ent_data == "":
			Global.ent_data = str(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
		else:
			Global.ent_data = Global.ent_data + "," + str(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
		if Global.draw_data == "":
			Global.draw_data = str(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
		else:
			Global.draw_data = Global.draw_data + "," + str(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
		
		time -= 1.0
		# cpu.set_text("CPU: %d" % Performance.get_monitor())
		# gpu.set_text("FPS: %d" % Engine.get_frames_per_second())
		# Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME)
