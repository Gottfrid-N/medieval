class_name PlayerStateMachine extends StateMachine

const STATE_PATHS: Dictionary[String, NodePath] = {
    "GROUNDED": ^"StateMachine/MovingCamera/Grounded",
    "GROUNDED_MOVING": ^"StateMachine/MovingCamera/Grounded/Moving",
    "AIRBORNE": ^"StateMachine/MovingCamera/Airborne",
    "AIRBORNE_MOVING": ^"StateMachine/MovingCamera/Airborne/Moving"
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