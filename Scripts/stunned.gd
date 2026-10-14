extends State
class_name Stunned 

@export var themselfs : Monster
var tt : Timer

func enter():
	themselfs.velocity = Vector2.ZERO
	themselfs.Stunned_timer.start()
	themselfs.Stun_sprite.visible = true
	themselfs.Stun_sprite.play()
	
func Update(_delta:float):
	if !themselfs.is_stunned:
		themselfs.Stun_sprite.visible = false
		themselfs.Stun_sprite.stop()
		if themselfs.sees_player:
			transitioned.emit(self,"follow")
		else:
			transitioned.emit(self,"idle")
