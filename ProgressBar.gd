extends ProgressBar

@onready var player_hp_component = Helpers.get_player().get_node('HealthComponent')

func _ready() -> void:
  player_hp_component.health_changed.connect(_on_player_health_changed)
  var starting_hp = player_hp_component.health
  self.max_value = starting_hp 
  self.value = starting_hp

func _on_player_health_changed(new_health: int) -> void:
  self.value = new_health