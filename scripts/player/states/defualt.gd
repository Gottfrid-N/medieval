extends PlayerState

func state_handle_input(input: InputEvent):
    pass

func state_enter(previous_state_path: NodePath) -> void:
    pass

func state_process(delta: float):
    pass

func state_physics_process(delta: float):
    switch_state.emit(state_machine.STATE_PATHS.GROUNDED_MOVING)

func state_exit():
    pass
