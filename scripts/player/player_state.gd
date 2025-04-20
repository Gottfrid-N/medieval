class_name PlayerState extends State

var player: Player
var state_machine: PlayerStateMachine

func _ready() -> void:
	await owner.ready

	player = owner
	state_machine = owner.get_node("StateMachine")
