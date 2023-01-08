extends BuildingProduction

func _ready():
	
	################################################################################
	building_name = "Farm"
	description =  "Produce " + str(output_done) + " " + output_name + " each " + str(time_needed) + " seconds "
	type = "production"
	################################################################################
	
	sprite.mouse_entered.connect(_on_mouse_entered)
	sprite.mouse_exited.connect(_on_mouse_exited)
	# Set Timer
	timer.wait_time = time_needed
	timer.autostart = true
	timer.timeout.connect(set_output)
