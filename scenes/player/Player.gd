extends CharacterBody2D
class_name Player

@export var stats: PlayerStats
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var health_component: HealthComponent = $HealthComponent as HealthComponent

func _ready() -> void: 
  pass
  # print(stats)
