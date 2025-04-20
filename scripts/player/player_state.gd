class_name PlayerState extends State

@onready var player: Player = owner
@onready var state_machine: PlayerStateMachine = owner.get_node("StateMachine")

