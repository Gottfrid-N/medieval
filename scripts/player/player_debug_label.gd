extends Label

var player: Player

func _ready() -> void:
	await owner.ready

	player = owner.get_node(^"Player")

func _process(delta: float) -> void:
	text = "p: %v v: %v
			state: %s" % [player.position, player.velocity, player.state_machine.state]
