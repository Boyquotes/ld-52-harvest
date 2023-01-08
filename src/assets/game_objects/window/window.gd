extends Control

@onready var title: String = ""
@onready var description: String = ""
@onready var type: String = ""
@onready var buildings: Array

@onready var title_label: Label = %Title
@onready var description_label: RichTextLabel = %Description
@onready var action_label: Label = %Action
@onready var buttons: GridContainer = %Buttons

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func build_window():
	title_label.text = title 
	description_label.text = description
	
	if type == "main":
		action_label.text = "Sell"
	elif type == "utility" or type == "production":
		action_label.text = ""
	elif type == "empty":
		action_label.text = "buy"
		build_buy_buttons()
	else :
		action_label.text = ""


func build_buy_buttons():
	# Clear
	for node in buttons.get_children():
		node.queue_free()
	
	# Build
	for building in buildings:
		var button: Button = Button.new()
#		var texture_normal: CompressedTexture2D = CompressedTexture2D.new()
#		texture_normal.load(building["icon_path"])
		button.text = building["name"].to_pascal_case()
		button.tooltip_text = building["name"]
		buttons.add_child(button)
