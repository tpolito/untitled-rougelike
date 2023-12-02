extends Node
class_name MoveComponent

@export var actor: CharacterBody2D
@export var direction: Vector2
# TODO: Move this to a speed component
@export var speed: float
@export var anim_player: AnimationPlayer
@export var sprite: Sprite2D

func _physics_process(_delta: float) -> void:
  if direction.x != 0 or direction.y != 0:
    anim_player.play("walk")
    sprite.flip_h = direction.x > 0
  else:
    anim_player.play("idle")
    pass
  # Move the sprite
  actor.velocity = direction * speed
  actor.move_and_slide()

