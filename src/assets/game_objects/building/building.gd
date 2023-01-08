extends Node2D

class_name Building

signal select

@onready var sprite: TextureRect = get_node("Sprite")
@onready var size: Vector2 = sprite.get_rect().size

var list_buildings: Array
var is_selected = false
var is_hovered = false

################################################################################
var building_name: String = ""
var description: String = ""
var type: String = "default"
@export var price: int = 50
################################################################################


func _ready():
	self.select.connect(_select)

func _on_mouse_entered():
	ProjectSettings.set("custom/gameplay/building_hover", self)
	is_hovered = true
	
func _on_mouse_exited():
	ProjectSettings.set("custom/gameplay/building_hover", null)
	is_hovered = false
	
	var buildings_quit: Array = ProjectSettings.get("custom/gameplay/buildings_quit")
	if self not in buildings_quit:
		buildings_quit.append(self)

func _select():
	is_selected = true
	print("building Selected")
