extends TextureRect

var Player : PC
var Animations_states = [
	preload("res://assets/assets-grafici/assets-miei/unloaded_shotgun_barrel.png"),
	preload("res://assets/assets-grafici/assets-miei/half_loaded_shotgun_barrel.png"),
	preload("res://assets/assets-grafici/assets-miei/shotgun_barrel.png")
]

func _ready() -> void:
	Player = get_tree().get_first_node_in_group("Player")
	
	
func _process(_delta: float) -> void:
	texture = Animations_states[Player.bullets_inside]
		
