extends Node
class_name MoveComponent

@export var actor: CharacterBody2D
@export var direction: Vector2
# @export var move_stats: MoveStats
@export var anim_player: AnimationPlayer
@export var sprite: Sprite2D
@export var knockback_component: KnockbackComponent

var knockback = Vector2.ZERO
var speed

func _ready() -> void:
  knockback_component.knockback.connect(_on_knockback_received)
  speed = get_parent().stats.speed

func _physics_process(_delta: float) -> void:
  if direction.x != 0 or direction.y != 0:
    anim_player.play("walk")
    sprite.flip_h = direction.x > 0
  else:
    anim_player.play("idle")
    pass
  # Move the sprite
  actor.velocity = direction * speed + knockback
  actor.move_and_slide()
  knockback = lerp(knockback, Vector2.ZERO, 0.1)

func _on_knockback_received(knockback_direction: Vector2, amount: float) -> void:
  knockback = knockback_direction * (amount * amount)
