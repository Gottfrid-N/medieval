class_name PlayerStateMachine extends StateMachine

const STATE_PATHS: Dictionary[String, NodePath] = {
    "GROUNDED": ^"/Player/StateMachine/MovingCamera/Grounded",
    "GROUNDED_MOVING": ^"/Player/StateMachine/MovingCamera/Grounded/Moving",
    "AIRBORNE": ^"/Player/StateMachine/MovingCamera/Airborne",
    "AIRBORNE_MOVING": ^"/Player/StateMachine/MovingCamera/Airborne/Moving"
}

func process(delta: float):
    if state != null:
        state.process(delta)

func physics_process(delta: float):
    if state != null:
        state.physics_process(delta)

func handle_input(event: InputEvent):
    if state != null:
        state.handle_input(event)