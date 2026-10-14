extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Interact")


func _on_timer_timeout() -> void:
	queue_free()
