extends CharacterBody2D
class_name Player

func _ready() -> void:
  pass

func _input(event): 
  if event is InputEventKey:
    if event.pressed and event.keycode == 80:
      $FlashComponent.flash()