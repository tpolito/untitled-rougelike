extends Node
class_name HealthComponent

@export var max_health = 10
@export var hurtbox_component: HurtboxComponent

var health = max_health:
  set(value):
    health = value
    if health <= 0:
      print('dead')


func _ready() -> void:
  hurtbox_component.damage.connect(_on_hurtbox_damage_taken)

func _on_hurtbox_damage_taken(hitbox: HitboxComponent) -> void:
  print('on_hurtbox_damage_taken')
  var damage = hitbox.damage
  health -= damage 
  print('health: ', str(health))