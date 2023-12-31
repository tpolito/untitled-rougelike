extends Area2D
class_name HitboxComponent

@export var damage: float = 1.0
@export var knockback_force: float = 10.0

signal hit_hurtbox(hurtbox)

func _ready() -> void:
  area_entered.connect(_on_hurtbox_area_entered)

func _on_hurtbox_area_entered(hurtbox: HurtboxComponent) -> void:
  if not hurtbox is HurtboxComponent:
    return
  hit_hurtbox.emit(hurtbox)
  hurtbox.damage.emit(self)