extends CPUParticles2D


var RNG = RandomNumberGenerator.new()
func _ready() -> void:
	add_to_group("Neve")
	RNG.randomize()
	



func _on_timer_timeout() -> void:
	speed_scale = RNG.randf_range(0.2,0.6)
