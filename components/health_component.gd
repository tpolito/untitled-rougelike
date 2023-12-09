extends Node
class_name HealthComponent

@export var max_health: int = 10
@export var hurtbox_component: HurtboxComponent
@export var flash_component: FlashComponent

signal health_changed(current_health: int)
signal died

var health:
  set(value):
    health = clamp(value, 0, get_parent().stats.max_health) 
    health_changed.emit(health)
    if health == 0:
      died.emit()
      print('dead')

func _ready() -> void:
  hurtbox_component.damage.connect(_on_hurtbox_damage_taken)
  health = get_parent().stats.max_health

func _on_hurtbox_damage_taken(hitbox: HitboxComponent) -> void:
  var damage = hitbox.damage
  health -= damage 
  if flash_component != null:
    flash_component.flash()
  print('Health: ', str(health))
