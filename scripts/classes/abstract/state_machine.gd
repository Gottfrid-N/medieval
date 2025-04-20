class_name StateMachine extends Node

@onready var state: State = get_child(0)

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
    assert(owner.has_node(next_state_path))
    var previous_state_path := state.get_path()

    state = get_node(NodePath(next_state_path.get_name(1)))
