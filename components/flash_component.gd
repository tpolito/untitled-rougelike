extends Node
class_name FlashComponent

@export var color: Color;
@export var sprite: Sprite2D;
@export var flash_duration: float = 1.0

func flash() -> void:
  var tween = create_tween()
  tween.tween_property(sprite, 'modulate', color, flash_duration / 4)
  tween.tween_property(sprite, 'modulate', Color.WHITE, flash_duration / 4)
  tween.tween_property(sprite, 'modulate', color, flash_duration / 4)
  tween.tween_property(sprite, 'modulate', Color.WHITE, flash_duration / 4)