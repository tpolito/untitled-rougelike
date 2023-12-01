extends Node2D

@onready var spirte = $PlayerSprite
@onready var anim_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  # Get movement direction based on input strength
  var movement = Vector2(
      Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
      Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
  ) 
  # Normalize the movement vector to ensure consistent speed in all directions
  movement = movement.normalized() * 50 * delta 
  # Flip the sprite if moving left
  if movement.x != 0:
      anim_player.play("walk")
      spirte.flip_h = movement.x > 0
  else:
      anim_player.play("idle")
  # Move the sprite
  position += movement

