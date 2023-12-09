extends Node2D
class_name EnemySpawner

@export var enemies_to_spawn: Array[PackedScene]
@export var debug_should_spawn: bool = true 
@export var spawn_distance: float = 500

var spawn_timer = Timer.new()

func _ready() -> void:
  randomize()
  self.add_child(spawn_timer)
  spawn_timer.timeout.connect(_on_spawn_timer_timeout)
  spawn_timer.set_wait_time(randf_range(.5,1.5))
  spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
  spawn_timer.set_wait_time(randf_range(.5,1.5))
  spawn_enemies()
  
func spawn_enemies() -> void:
  if debug_should_spawn == false:
    return
  var player_pos = Utils.get_player().position
  var enemy_to_spawn = enemies_to_spawn[0]
  var angle = randf() * PI * 2
  var rand_spawn_pos = Vector2(player_pos.x + cos(angle) * spawn_distance, player_pos.y + sin(angle) * spawn_distance)
  var enemy_instance = enemy_to_spawn.instantiate()
  add_child(enemy_instance)
  enemy_instance.global_position = rand_spawn_pos
