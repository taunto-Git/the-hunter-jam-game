extends Node2D


var Enemy := load("res://Scene/monster.tscn")
@onready var y_sort_spawns := $y_sort


func _on_spawn_time_timeout() -> void:
	var Child : Monster = Enemy.instantiate()
	Child.global_position = global_position + Vector2(10,10)
	y_sort_spawns.add_child(Child)
	
