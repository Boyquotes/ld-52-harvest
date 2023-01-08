extends Building

class_name BuildingProduction

@export var input_name: String = ""
@export var output_name: String = ""
@export var input_needed: int = 0
@export var output_done: int = 0
@export var time_needed: float = 0

@onready var timer: Timer = %Timer
@onready var label_prod: Label = %Label_Production
@onready var anim_player: AnimationPlayer = %AnimationPlayer

func _ready():
	
	################################################################################
	if input_name:
		description = "Need " + str(input_needed) + input_name + " to Produce " + str(output_done) + output_name + " each " + str(time_needed) + "seconds "
	else:
		description = "Produce " + str(output_done) + output_name + " each " + str(time_needed) + "seconds "
	type = "production"
	################################################################################

# Called when the node enters the scene tree for the first time.
func get_input() -> int:
	if input_name == "":
		return 0
	var current_input: int = ProjectSettings.get("custom/variables/" + input_name)
	return current_input


# Called every frame. 'delta' is the elapsed time since the previous frame.
func production() -> int:
	var current_input: int = get_input()
	if current_input >= input_needed:
		var new_input_count: int = current_input - input_needed
		ProjectSettings.set("custom/variables/" + input_name, new_input_count)
		return output_done
	else :
		return 0
	

func set_output() -> void:
	var output_count:int = production()
	if not output_count:
		return
	label_prod.text = "+" + str(output_count)
	anim_player.play("production_done")
	var current_output: int = ProjectSettings.get("custom/variables/" + output_name)
	var new_output_count: int = current_output + output_count
	ProjectSettings.set("custom/variables/" + output_name, new_output_count)
