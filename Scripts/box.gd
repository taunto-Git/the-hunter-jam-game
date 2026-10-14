extends StaticBody2D


var RNG : RandomNumberGenerator = RandomNumberGenerator.new()
var has_opened : bool = false
var Player : PC 

var rations_options = ["food","water"]

func _ready() -> void:
	Player = get_tree().get_first_node_in_group("Player")
	RNG.randomize()

func _on_open_area_area_entered(area: Area2D) -> void:
	if has_opened:
		return
	elif area.is_in_group("Interact"):
		var index = RNG.randi_range(0,rations_options.size())
		Player.rations[rations_options[index]] += 1
		has_opened = true
