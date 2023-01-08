extends Node


# Tutorial
@onready var tuto_townhall_done = false

# Game Objects
@export var townhall: NodePath
@export var wall: NodePath
@onready var time_system: = %Time_System


# Called when the node enters the scene tree for the first time.
func _ready():
	# Start The First Day
	time_system.day()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
