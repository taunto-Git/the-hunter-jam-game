extends State
class_name follow

@export var themselfs : Monster
var Player : PC



func enter():
	Player = get_tree().get_first_node_in_group("Player")
	themselfs.Nav.target_position = get_safe_pos()
	


func get_safe_pos() -> Vector2:
	var raw_pos = Player.global_position
	var map_RID = themselfs.get_world_2d().navigation_map
	var safe_pos = NavigationServer2D.map_get_closest_point(map_RID,raw_pos)
	return safe_pos
	
func Physics_process(_delta: float) -> void:
	if themselfs.can_search:
		themselfs.Nav.target_position = get_safe_pos()
		print("here")
		themselfs.can_search = false
	if themselfs.global_position.distance_to(themselfs.Nav.target_position) > 2:
		var dir = themselfs.global_position.direction_to(themselfs.Nav.get_next_path_position())
		themselfs.velocity = dir * (themselfs.Speed)
		
	else:
		themselfs.velocity = Vector2.ZERO
	
	if !themselfs.sees_player:
		transitioned.emit(self,"idle")
	elif themselfs.is_stunned:
		transitioned.emit(self,"Stunned")
