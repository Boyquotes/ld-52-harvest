extends Node2D

class_name Building

@onready var sprite: TextureRect = get_node("Sprite_Empty")
@onready var size: Vector2 = sprite.get_rect().size

var list_buildings: Array
var is_selected = false
var is_hovered = false

func _on_mouse_entered():
	ProjectSettings.set("custom/gameplay/building_hover", self)
	is_hovered = true
	
func _on_mouse_exited():
	ProjectSettings.set("custom/gameplay/building_hover", null)
	is_hovered = false
	
	var buildings_quit: Array = ProjectSettings.get("custom/gameplay/buildings_quit")
	if self not in buildings_quit:
		buildings_quit.append(self)
