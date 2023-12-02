extends Node
class_name Utils

func get_player() -> Player:
  return  get_tree().get_nodes_in_group("player")[0]