extends TextureRect


@onready var Label_food := $Label_food
@onready var Label_water := $Label_water
var Player : PC
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player = get_tree().get_first_node_in_group("Player")
	
func _process(_delta: float) -> void:
	Label_food.text = String.num_int64(Player.rations["food"])
	Label_water.text = String.num_int64(Player.rations["water"])
