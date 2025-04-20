class_name Player extends CharacterBody2D

@export var default_acceleration := 10.0
@export var acceleration := default_acceleration

@export var default_friction: float = 4.0
@export var friction := default_friction

@export var speed := 0.0
@export var input_direction := 0.0
@export var input_direction_vector := Vector2(0, 0)

@onready var state_machine: PlayerStateMachine = $"StateMachine"

func _ready():
    pass

func _process(delta):
    state_machine.process(delta)

func _physics_process(delta): 
    input_direction = Input.get_axis("move_left", "move_right")
    input_direction_vector = Vector2(cos(input_direction), sin(input_direction))
    speed = velocity.length()

    state_machine.physics_process(delta)

    move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
    state_machine.handle_input(event)

func move_camera(delta: float):
    pass

func apply_friction(delta: float):
    if speed != 0:
        var drop = speed * friction * delta
        velocity *= max(speed - drop, 0) / speed

func apply_acceleration(delta: float):
    var acceleration_velocity = acceleration * delta
    velocity += acceleration_velocity * input_direction_vector

func apply_gravity(delta: float):
    velocity.y += get_gravity().y * delta 
