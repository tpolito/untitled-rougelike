extends Node
class_name MoveComponent

@export var actor: Node2D
@export var velocity: Vector2
@export var anim_player: AnimationPlayer
@export var sprite: Sprite2D

func _process(delta: float) -> void:
  if velocity.x != 0 or velocity.y != 0:
    anim_player.play("walk")
    sprite.flip_h = velocity.x > 0
  else:
    anim_player.play("idle")
    pass
  # Move the sprite
  actor.position +=velocity 

