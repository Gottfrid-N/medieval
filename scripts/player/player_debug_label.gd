extends Label

var player: Player

func _ready() -> void:
    await owner.ready

    player = owner.get_node(^"Player")

func get_sub_state_tree(state: State, array: Array[State] = []) -> Array[State]:
    array.append(state)

    if state.sub_state != null:
        array.append(get_sub_state_tree(state.sub_state, array))
    
    return array

func _process(delta: float) -> void:
    var sub_states = ""
    for sub_state in get_sub_state_tree(player.state_machine.state):
        sub_states += "-> %s" % [sub_state]

    text = "p: %v v: %v
            state: %s" % [player.position, player.velocity, sub_states]
