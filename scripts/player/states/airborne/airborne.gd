extends PlayerState

func state_handle_input(input: InputEvent):
    pass

func state_enter(previous_state_path: NodePath) -> void:
    player.acceleration /= 2

func state_process(delta: float):
    pass

func state_physics_process(delta: float):
    if player.is_on_floor() and sub_state == null:
        switch_state.emit(state_machine.STATE_PATHS.GROUNDED)
    
    player.apply_gravity(delta)

func state_exit():
    player.acceleration *= 2
