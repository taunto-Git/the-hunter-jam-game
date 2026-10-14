extends TextureRect


var Player : PC

@onready var coldness_bar :=$coldness_bar
@onready var Electricity_bar := $Electricity_bar


func _ready() -> void:
	Player = get_tree().get_first_node_in_group("Player")
	
	

func _process(delta: float) -> void:
	Electricity_bar.value = Player.battery
	coldness_bar.value = Player.Coldness



func _on_timer_timeout() -> void:
	if Player.Torch_on:
		Electricity_bar.value -= 1
