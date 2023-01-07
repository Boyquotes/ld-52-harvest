extends Node2D

@onready var Town: Sprite2D = get_node("Town_Background")
@onready var Wall: Sprite2D = get_node("Wall_Background")
@onready var Land: Sprite2D = get_node("Land_Background")


func get_width() -> float:
	var width: float = 0.0
	
	width += Town.get_rect().size.x
	width += Wall.get_rect().size.x
	width += Land.get_rect().size.x
	return width
