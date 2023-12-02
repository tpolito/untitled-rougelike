extends Node
class_name MoveInputComponent

@export var move_component: MoveComponent

func _process(delta: float) -> void:
  # Get movement direction based on input strength
  var movement = Vector2(
      Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
      Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
  ) 
  # Normalize the movement vector to ensure consistent speed in all directions
  movement = movement.normalized() * 50 * delta 

  move_component.velocity = movement 