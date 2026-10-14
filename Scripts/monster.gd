extends "res://Scripts/entity_base.gd"
class_name Monster

@onready var Stunned_timer := $Stunned
@onready var Stun_sprite :=$Stun
@onready var search_timer := $search


var cambio_dir : bool = false
var sees_player : bool = false
var attacking : bool = false
var change_animation : bool = false
var is_stunned : bool = false
var can_search : bool = true

var Animations_sheets = [
	["behind_idle","forward_idle","horizontal_idle"],
	["behind_running","forward_running","horizontal_running"]
]
enum Animations_states { IDLE,Follow,attacking,jumping } 
enum Position_states {behind,forward,horizontal}

var last_index : int 

func _ready() -> void:
	add_to_group("Monster")
	Stun_sprite.visible = false

func _physics_process(_delta: float) -> void:
	if change_animation:
		change_animation = false
		Animations()
	move_and_slide()
	


func _on_perception_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		change_animation = true
		sees_player = true


func _on_perception_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		change_animation = true
		sees_player = false


func _on_timer_timeout() -> void:
	cambio_dir = true
	
func Animations():
	if is_stunned:
		Anim.play()
		Anim.pause()
		return
	if !Anim.is_playing():
		Anim.play()
	var vel_x = sqrt(velocity.x)
	var vel_y = sqrt(velocity.y)
	if is_nan(vel_x):
		vel_x = -velocity.x
	else:
		vel_x = velocity.x
	if is_nan(vel_y):
		vel_y = -velocity.y
	else:
		vel_y = velocity.y
	
	if velocity == Vector2.ZERO and !attacking:
		var index = randi_range(0,2)
		last_index = index
		Anim.animation = Animations_sheets[Animations_states.IDLE][index]
	elif vel_x > vel_y :
		if velocity.x > 0.01:
			Anim.flip_h = false
			Anim.animation = Animations_sheets[Animations_states.Follow][Position_states.horizontal]
		elif velocity.x < 0.01:
			Anim.flip_h = true
			Anim.animation = Animations_sheets[Animations_states.Follow][Position_states.horizontal]
	else:
		if velocity.y > 0.01:
			Anim.animation = Animations_sheets[Animations_states.Follow][Position_states.behind]
		elif velocity.y < 0.01:
			Anim.animation = Animations_sheets[Animations_states.Follow][Position_states.forward]

	

func _on_sprite_2d_animation_looped() -> void:
		Animations()


func _on_stunned_timeout() -> void:
	is_stunned = false


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		is_stunned = true


func _on_perception_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		change_animation = true
		sees_player = true


func _on_search_timeout() -> void:
	can_search = true
