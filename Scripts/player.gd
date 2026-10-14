extends CharacterBody2D
class_name PC

var bulleto := load("res://Scene/bullet.tscn")
var Interact := load("res://Scene/interact.tscn")

@export var Health : int
@export var Speed : int
@export var Sprint : int
@export var Bullets : int
@export var Coldness : float
@export var Hungryness : float
@export var Thirst : float
@export var battery : float

@onready var mirino :=$mirino
@onready var Anim := $Sprite2D
@onready var Sounds := $AudioStreamPlayer2D
@onready var interact_timer := $interact_timer
@onready var Weapon := $mirino/Sprite2D
var bullets_inside : int = 2

var can_interact : bool = true
var Torch_on : bool = true

var rations ={
	"food" : 0,
	"water" : 0
}



func _ready() -> void:
	add_to_group("Player")


func _physics_process(_delta: float) -> void:
	move_and_slide()
	

func die()->void:
	get_tree().reload_current_scene()
	
	


func _on_interact_timer_timeout() -> void:
	can_interact = true
