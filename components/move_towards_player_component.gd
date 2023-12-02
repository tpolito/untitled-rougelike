extends Node
class_name MoveTowardsPlayerComponent

@export var move_component: MoveComponent
@export var actor: Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  var player_pos = Helpers.get_player().position
  var target = (player_pos - actor.position).normalized()
  var movement = target * 550 * delta

  move_component.direction= movement
