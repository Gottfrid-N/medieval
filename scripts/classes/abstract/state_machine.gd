class_name StateMachine extends Node

func _ready() -> void:
    for state_node: State in find_children("*", "", true, false):
        state_node.switch_state.connect(_on_state_switch_state)

func _process(delta):
    pass

func _physics_process(delta):
    pass

func _unhandled_input(event: InputEvent) -> void:
    pass

func _on_state_switch_state(next_state):
    pass