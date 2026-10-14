extends Area2D
class_name bullet

var rota : float
var Speed : int = 1200
var dir : Vector2



func _ready() -> void:
	add_to_group("Bullet")
	rotation = rota
	
func _process(delta: float) -> void:
	position += transform.x * Speed * delta
	
	

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Monster"):
		queue_free()
