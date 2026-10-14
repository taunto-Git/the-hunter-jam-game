extends State
class_name Idle_player

#variabile per interagire con il padre (il mio non torna da mesi)
@export var themselfs : PC





func Physics_process(_delta: float) -> void:
	var can_load : bool 
	if themselfs.bullets_inside < 2 and themselfs.Bullets > 0:
		can_load = true
	else:
		can_load = false
	var dir = Input.get_vector("left","right","forward","behind")
	if Input.is_action_pressed("Sprint"):
		themselfs.velocity =  dir * themselfs.Sprint
	else:
		themselfs.velocity =  dir * themselfs.Speed
	
	
	if Input.is_action_just_released("Shoot") and themselfs.bullets_inside > 0:
		var child : bullet = themselfs.bulleto.instantiate()
		child.rota = themselfs.mirino.rotation
		child.global_position = themselfs.mirino.global_position
		themselfs.get_tree().root.add_child(child)
		themselfs.Sounds.play()
		themselfs.bullets_inside -= 1



	if themselfs.can_interact:
		if Input.is_action_just_released("Interact"):
			var child : Area2D = themselfs.Interact.instantiate()
			child.global_position = themselfs.global_position
			themselfs.get_tree().root.add_child(child)
			themselfs.interact_timer.start()
			themselfs.can_interact = false
			
		if Input.is_action_just_released("Load") and can_load:
			themselfs.bullets_inside +=1
			themselfs.Bullets -= 1
			themselfs.interact_timer.start()
	Animations()
	
	
func Animations():
	if (themselfs.mirino.rotation_degrees > 119 and themselfs.mirino.rotation_degrees < 231):
		themselfs.Anim.flip_h = false
		themselfs.Weapon.flip_v = true
	elif (themselfs.mirino.rotation_degrees > 50 and themselfs.mirino.rotation_degrees > 231):
		themselfs.Anim.flip_h = true
		themselfs.Weapon.flip_v = false
		
