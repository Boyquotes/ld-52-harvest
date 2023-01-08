extends Node


@onready var timer_day: Timer = %Timer_Day
@onready var timer_night: Timer = %Timer_Night
@onready var time_anim: AnimationPlayer = %Time_Anim

@onready var day_label: Label = %Day_Label
@onready var day_count: int = ProjectSettings.get("custom/variables/day")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_day.timeout.connect(day_to_night)
	timer_night.timeout.connect(night_to_day)

	time_anim.animation_finished.connect(anim_finished)

func day() -> void:
	timer_day.start()

func day_to_night() -> void:
	time_anim.play("Day_to_Night")
	
func night() -> void:
	day_count += 1
	ProjectSettings.set("custom/variables/day", day_count)
	day_label.text = "DAY " + str(day_count)
	time_anim.play("Night")
	timer_night.start()

func night_to_day() -> void:
	time_anim.play("Night_to_Day")
	
func anim_finished(anim_name:StringName) -> void:
	if anim_name == "Day_to_Night":
		night()
	elif anim_name == "Night_to_Day":
		day()
	else:
		return
