extends Node
class_name KnockbackComponent

@export var actor: CharacterBody2D
@export var hurtbox_component: HurtboxComponent

signal knockback(knockback_direction: Vector2, knockback_amount: float)

func _ready() -> void:
  hurtbox_component.damage.connect(_on_hurtbox_damage_taken)

func _on_hurtbox_damage_taken(hitbox: HitboxComponent) -> void:
  var direction = actor.global_position - hitbox.global_position
  knockback.emit(direction, hitbox.knockback_force)
