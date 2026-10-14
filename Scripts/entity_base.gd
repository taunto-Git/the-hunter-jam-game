extends CharacterBody2D

@export var Health : int
@export var Speed : int
@export var damage_taken : int
@onready var Nav :=  $NavigationAgent2D
@onready var Hitbox := $Hitbox
@onready var Anim : AnimatedSprite2D = $Sprite2D




func Die()->void:
	queue_free()
