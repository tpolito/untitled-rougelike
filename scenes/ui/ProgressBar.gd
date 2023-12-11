extends ProgressBar

@onready var player = Utils.get_player()

func _ready() -> void:
  var player_hp_component = player.get_node('HealthComponent')
  player_hp_component.health_changed.connect(_on_player_health_changed)
  var starting_hp = player.stats.max_health
  self.max_value = starting_hp 
  self.value = starting_hp

func _on_player_health_changed(new_health: int) -> void:
  self.value = new_health
