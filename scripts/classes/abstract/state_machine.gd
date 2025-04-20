class_name StateMachine extends Node

@onready var state: State = get_child(0)

func _ready() -> void:
    await owner.ready

    for state_node: State in find_children("*", "", true, false):
        state_node.switch_state.connect(_on_state_switch_state)
    
    state.enter(^"")

func process(delta: float):
    if state != null:
        state.process(delta)

func physics_process(delta: float):
    if state != null:
        state.physics_process(delta)

func handle_input(event: InputEvent):
    if state != null:
        state.handle_input(event)

func _on_state_switch_state(next_state_path: NodePath):
    assert(owner.has_node(next_state_path))
    print(next_state_path)

    var previous_state_path = owner.get_path_to(state)
    print("changing")
    state.exit()
    state = get_node(NodePath(next_state_path.get_name(1)))
    state.enter(previous_state_path, next_state_path)
