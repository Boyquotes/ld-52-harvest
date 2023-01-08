extends Building



func _ready():
	
	################################################################################
	building_name = "Townhall"
	description = "The townhall is here to buy sell things !"
	type = "main"
	################################################################################
	
	sprite.mouse_entered.connect(_on_mouse_entered)
	sprite.mouse_exited.connect(_on_mouse_exited)
	
	
