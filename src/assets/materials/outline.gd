extends TextureRect

@onready var line_color_on: Color = ProjectSettings.get("custom/graphics/line_color_on") 
@onready var line_color_off: Color = ProjectSettings.get("custom/graphics/line_color_off") 
@onready var line_thickness_on: float = ProjectSettings.get("custom/graphics/line_thickness") 
@onready var parent = get_parent()

var mouse_hover = false


func _ready():
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)

func _process(_delta):
	if parent.is_selected or parent.is_hovered:
		hover()
	else:
		unhover()

func _on_mouse_entered():
	hover()

func _on_mouse_exited():
	unhover()

func hover():
	self.material.set_shader_parameter("line_color", line_color_on)
	self.material.set_shader_parameter("line_thickness", line_thickness_on)

func unhover():
	self.material.set_shader_parameter("line_color", line_color_off)
	self.material.set_shader_parameter("line_thickness", 0)
