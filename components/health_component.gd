extends Node
class_name HealthComponent

@export var max_health = 10
@export var hurtbox_component: HurtboxComponent
@export var flash_component: FlashComponent

signal health_changed(current_health: int)

var health = max_health:
  set(value):
    health = clamp(value, 0, max_health) 
    health_changed.emit(health)
    if health == 0:
      print('dead')

func _ready() -> void:
  hurtbox_component.damage.connect(_on_hurtbox_damage_taken)

func _on_hurtbox_damage_taken(hitbox: HitboxComponent) -> void:
  var damage = hitbox.damage
  health -= damage 
  if flash_component != null:
    flash_component.flash()
  print('Health: ', str(health))