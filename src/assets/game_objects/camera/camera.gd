extends Camera2D

@export var speed: float
@export var mouse_center_area: float

var background_width: float = 0
var viewport_width = ProjectSettings.get("display/window/size/viewport_width")
@onready var mouse_left_area = (viewport_width/2) - (mouse_center_area/2)
@onready var mouse_right_area = (viewport_width/2) + (mouse_center_area/2)

# Called when the node enters the scene tree for the first time.
func _ready():
	var Background = %Background
	background_width = Background.get_width()
	limit_right = background_width
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var mouse_position = get_viewport().get_mouse_position()
	var offset_x: float = 0
	
	# Mouse
	if mouse_position.x <= mouse_left_area:
		offset_x += speed * delta * -1
	elif mouse_position.x >= mouse_right_area:
		offset_x += speed * delta
	
	# Keyboard
	if Input.is_action_pressed("ui_right"):
		offset_x += speed * delta
	elif Input.is_action_pressed("ui_left"):
		offset_x += speed * delta * -1
	
	# New Position
	var new_position_x = floor(position.x + offset_x)
	
	if new_position_x >= 0 and new_position_x <= background_width - viewport_width:
		position.x = new_position_x
	else:
		if new_position_x < 0:
			position.x = 0
		elif new_position_x > background_width - viewport_width:
			position.x = background_width - viewport_width
