class_name PlayerState extends State

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
