extends Node

@export var initial_state : State
var states : Dictionary = {}
var current_state : State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(change_state)
	await get_parent().ready
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_process(delta)
		
func change_state(state,new_state_name):
	if state != current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
