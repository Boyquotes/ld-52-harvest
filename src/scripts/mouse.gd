extends Node

@onready var window: Control = %Window

func _input(event):
	
	# Check action
	if not event.is_action_released("left_mouse"):
		return
	
	# UNSELECT BUILDINGS
	var buildings_quit: Array = ProjectSettings.get("custom/gameplay/buildings_quit")
	for building in buildings_quit:
		building.is_selected = false
	buildings_quit.clear()
	ProjectSettings.set("custom/gameplay/buildings_quit", buildings_quit)
	
	# Check mouse hover a building
	var building_hover = ProjectSettings.get("custom/gameplay/building_hover")
	if not is_instance_valid(building_hover):
		hide_building_window()
		return
		
	# SELECT BUILDINGS
	building_hover.is_selected = true
	
	show_building_window(building_hover)

func show_building_window(building):
	
	window.title = building.building_name
	window.description = building.description
	window.type = building.type
	print(building.type)
	if "buildings_list" in building:
		print(building.buildings_list)
		window.buildings = building.buildings_list
	window.build_window()
	
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	window.position = mouse_position
	window.visible = true
	
	
func hide_building_window():
	pass
	window.visible = false
