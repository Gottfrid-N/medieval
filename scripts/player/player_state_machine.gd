class_name PlayerStateMachine extends StateMachine

const STATE_PATHS: Dictionary[String, NodePath] = {
    "GROUNDED": ^"StateMachine/MovingCamera/Grounded",
    "GROUNDED_MOVING": ^"StateMachine/MovingCamera/Grounded/Moving",
    "AIRBORNE": ^"StateMachine/MovingCamera/Airborne",
    "AIRBORNE_MOVING": ^"StateMachine/MovingCamera/Airborne/Moving"
}
