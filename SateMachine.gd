extends Node2D
class_name StateMachine

var state = null
var previous_state = null
var states = {}

@onready var parent = get_parent()

func _physics_process(delta):
	if !state: pass
	
	_state_logic(delta)
	var transition = _get_transition(delta)
	
	if transition:
		set_state(transition)

func _state_logic(delta):
	pass
	
func _get_transition(delta):
	return null
	
# Common for setting animation or starting timers
func _enter_state(new_state, old_state):
	pass
	
func _exit_state(old_state, new_state):
	pass
	
func set_state(new_state):
	previous_state = state
	state = new_state
	
	if previous_state:
		_exit_state(previous_state, state)
	
	if new_state:
		_enter_state(state, previous_state)
	
func add_states(state_name):
	states[state_name] = state_name
