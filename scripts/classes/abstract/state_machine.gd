class_name StateMachine extends Node

@onready var state: State = get_child(0)

func get_sub_state(_state: State, depth: int) -> State:
	if depth > 0:
		return get_sub_state(_state.sub_state, depth - 1)
	return _state.sub_state

func get_sub_state_array(relative_state_path: NodePath):
	var array = []
	for i in relative_state_path.get_subname_count():
		array.append(relative_state_path.slice(0, i))
	
	return array

func _ready() -> void:
	for state_node: State in find_children("*", "", true, false):
		state_node.switch_state.connect(_on_state_switch_state)

	await owner.ready
	state.enter(^"")

func process(delta: float):
	assert(false, "Unoverriden abstract method")

func physics_process(delta: float):
	assert(false, "Unoverriden abstract method")

func unhandled_input(event: InputEvent) -> void:
	assert(false, "Unoverriden abstract method")

func _on_state_switch_state(next_state_path: NodePath):
	assert(has_node(next_state_path))
	var previous_state_path := state.get_path()

	var i: int = 0
	while previous_state_path.get_subname(i) == next_state_path.get_subname(i):
		i += 1
	
	var common_state: State = get_sub_state(state, i)
	common_state.sub_state.exit()
	common_state.enter(previous_state_path, get_sub_state_array(common_state.get_path_to(get_node(next_state_path))))
