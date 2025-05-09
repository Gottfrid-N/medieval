extends PlayerState

func state_handle_input(input: InputEvent):
    pass

func state_enter(previous_state_path: NodePath) -> void:
    pass

func state_process(delta: float):
    pass

func state_physics_process(delta: float):
    if not player.is_on_floor() and sub_state == null:
        switch_state.emit(state_machine.STATE_PATHS.AIRBORNE)

    player.apply_friction(delta)

func state_exit():
    pass
