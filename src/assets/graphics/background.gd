extends Node2D

@onready var Town: Sprite2D = get_node("Town_Background")
@onready var Wall: Sprite2D = get_node("Wall_Background")
@onready var Land: Sprite2D = get_node("Land_Background")

@export var camera: Camera2D

func get_width() -> int:
	var width: int = 0
	
	width += Town.get_rect().size.x
	width += Wall.get_rect().size.x
	width += Land.get_rect().size.x
	return width

func _ready():
	var width: int = get_width()
	camera.limit_right = width
	camera.background_width = width
