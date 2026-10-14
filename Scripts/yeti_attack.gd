extends Area2D



func _ready() -> void:
	add_to_group("Yeti-attack")






func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
