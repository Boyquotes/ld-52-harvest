extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	
	# Check action
	if not event.is_action_released("left_mouse"):
		return
	
	# UNSELECT BUILDINGS
	var buildings_quit: Array = ProjectSettings.get("custom/gameplay/buildings_quit")
	for building in buildings_quit:
		building.is_selected = false
	print(buildings_quit)
	buildings_quit.clear()
	ProjectSettings.set("custom/gameplay/buildings_quit", buildings_quit)
	
	
	# Check mouse hover a building
	var building_hover = ProjectSettings.get("custom/gameplay/building_hover")
	if not is_instance_valid(building_hover):
		return
		
	# SELECT BUILDINGS
	building_hover.is_selected = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
