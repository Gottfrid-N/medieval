class_name State extends Node

## next_state_path is from owner
signal switch_state(next_state_path: NodePath)

var sub_state: State = null

func _ready() -> void:
    for child: State in get_children():
        child.switch_state.connect(_on_sub_state_switch_state)

func handle_input(input: InputEvent):
    state_handle_input(input)
    if sub_state != null:
        sub_state.handle_input(input)

func enter(previous_state_path: NodePath, _sub_states: Array[State] = [null]) -> void:
    state_enter(previous_state_path)
    sub_state = _sub_states[0]
    if sub_state != null:
        sub_state.enter(previous_state_path, _sub_states.slice(1))

func process(delta: float):
    state_process(delta)
    if sub_state != null:
        sub_state.process(delta)

func physics_process(delta: float):
    await ready
    state_physics_process(delta)
    if sub_state != null:
        sub_state.physics_process(delta)

func exit():
    state_exit()
    if sub_state != null:
        sub_state.exit()

func _on_sub_state_switch_state(next_state_path: NodePath):
    

func state_handle_input(input: InputEvent):
    assert(false, "Unoverriden abstract method")

func state_enter(previous_state_path: NodePath) -> void:
    assert(false, "Unoverriden abstract method")

func state_process(delta: float):
    assert(false, "Unoverriden abstract method")

func state_physics_process(delta: float):
    assert(false, "Unoverriden abstract method")

func state_exit():
    assert(false, "Unoverriden abstract method")
