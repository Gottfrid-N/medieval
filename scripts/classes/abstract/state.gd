class_name State extends Node

## next_state_path is from owner
signal switch_state(next_state_path: NodePath)

var sub_state: State = null

func _ready() -> void:
    await owner.ready

    for child: State in get_children():
        child.switch_state.connect(_on_sub_state_switch_state)

func handle_input(input: InputEvent):
    state_handle_input(input)
    if sub_state != null:
        sub_state.handle_input(input)

func enter(previous_state_path: NodePath, sub_state_path: NodePath = ^"") -> void:
    state_enter(previous_state_path)
    if sub_state_path != ^"":
        set_sub_state(sub_state_path)
        if sub_state != null:
            sub_state.enter(previous_state_path, sub_state_path)

func process(delta: float):
    state_process(delta)
    if sub_state != null:
        sub_state.process(delta)

func physics_process(delta: float):
    state_physics_process(delta)
    if sub_state != null:
        sub_state.physics_process(delta)

func exit():
    state_exit()
    if sub_state != null:
        sub_state.exit()

func _on_sub_state_switch_state(next_state_path: NodePath):
    assert(owner.has_node(next_state_path))

    var previous_state_path = owner.get_path_to(self)
    if previous_state_path.get_name(previous_state_path.get_name_count() - 1) == next_state_path.get_name(previous_state_path.get_name_count() - 1):
        sub_state.exit()
        set_sub_state(next_state_path)
        if sub_state != null:
            sub_state.enter(previous_state_path, next_state_path)
    else:
        switch_state.emit(next_state_path)

func set_sub_state(sub_state_path: NodePath):
    var relative_sub_state_path = get_path_to(owner.get_node(sub_state_path))
    assert(has_node(relative_sub_state_path), "i fucked up")

    if relative_sub_state_path != ^".":
        sub_state = get_node(relative_sub_state_path)
    else:
        sub_state = null


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
