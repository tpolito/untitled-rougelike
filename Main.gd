extends Node2D

@onready var player_camera_anchor = $Player/CameraAnchor
@onready var player_camera = $PlayerCamera

func _ready() -> void:
  player_camera_anchor.remote_path = player_camera.get_path()

# DEBUG CODE:
func _input(event): 
  if event is InputEventKey:
    if event.pressed and event.keycode == 49: # 1
      $PlayerCamera.zoom.x = .5
      $PlayerCamera.zoom.y = .5
    if event.pressed and event.keycode == 50: # 1
      $PlayerCamera.zoom.x = 3
      $PlayerCamera.zoom.y = 3
