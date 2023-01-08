extends HBoxContainer

@onready var l_day: Label = %L_Day
@onready var l_food: Label = %L_Food
@onready var l_money: Label = %L_Money
@onready var l_dead_body: Label = %L_Dead
@onready var l_fertilizer: Label = %L_Fertilizer
@onready var l_people: Label = %L_People
@onready var l_max_people: Label = %L_Max_People

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get Values
	var day: int = ProjectSettings.get("custom/variables/day")
	var food: int = ProjectSettings.get("custom/variables/food")
	var money: int = ProjectSettings.get("custom/variables/money")
	var dead_body: int = ProjectSettings.get("custom/variables/dead_body")
	var fertilizer: int = ProjectSettings.get("custom/variables/fertilizer")
	var people: int = ProjectSettings.get("custom/variables/people")
	var max_people: int = ProjectSettings.get("custom/variables/max_people")
	
	
	# Display Values UI
	l_day.text = str(day)
	l_food.text = str(food)
	l_money.text = str(money)
	l_dead_body.text = str(dead_body)
	l_fertilizer.text = str(fertilizer)
	l_people.text = str(people)
	l_max_people.text = str(max_people)
