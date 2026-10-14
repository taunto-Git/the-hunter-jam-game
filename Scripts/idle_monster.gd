extends State
class_name idle_monster 

@export var themselfs : Monster

var bounds_min : Vector2 = Vector2(-1500,-2200)
var bounds_max : Vector2 = Vector2(1200,600)
var next_raw_pos : Vector2
var next_safe_pos : Vector2


func _ready() -> void:
	await  get_tree().physics_frame
	choose_safe_destination()
	themselfs.Nav.target_position = next_safe_pos


func choose_safe_destination():
	var rand_x = randf_range(bounds_min.x,bounds_max.x)
	var rand_y = randf_range(bounds_min.y,bounds_max.y)
	next_raw_pos =  Vector2(rand_x,rand_y)
	var map_rid = themselfs.get_world_2d().navigation_map
	next_safe_pos = NavigationServer2D.map_get_closest_point(map_rid,next_raw_pos)


func Physics_process(_delta: float) -> void:
	if themselfs.Nav.is_navigation_finished():
		themselfs.velocity = Vector2.ZERO
	else:
		var dir = themselfs.global_position.direction_to(themselfs.Nav.get_next_path_position())
		themselfs.velocity = dir * themselfs.Speed
	if themselfs.cambio_dir:
		choose_safe_destination()
		themselfs.Nav.target_position = next_safe_pos
		themselfs.cambio_dir = false
	if themselfs.sees_player:
		transitioned.emit(self,"follow")
	elif themselfs.is_stunned:
		transitioned.emit(self,"Stunned")
