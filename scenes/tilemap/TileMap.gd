extends TileMap

@export var world_seed := 0

const TREE := 0
const GRASS := 2
const BUSH := 4

var rng = RandomNumberGenerator.new()
var width = 128
var height = 128

var biome := 0

func _ready() -> void:
  rng.randomize()
  biome = randi_range(0, 9)
  generate_chunk()

func _process(_delta: float) -> void:
  # generate_chunk()
  pass

func generate_chunk() -> void:
  var tile_pos = local_to_map(Vector2(0,0))
  for x in range(width):
    for y in range(height):
      # var moist = moisture.get_noise_2d(tile_pos.x - width / 2 + x, tile_pos.y - height / 2 + y)
      var rand = rng.randf_range(0, 100)
      if rand > 93:
        set_cell(0, Vector2(x,y), 0, Vector2(biome, TREE))
      elif rand > 65 and rand < 70:
        set_cell(0, Vector2(x,y), 0, Vector2(biome, GRASS))
      elif rand > 10 and rand < 15:
        set_cell(0, Vector2(x,y), 0, Vector2(biome, BUSH))

func _input(event): 
  if event is InputEventKey:
    # TODO: Is there a better way to get this aside from these arcane codes
    if event.pressed and event.keycode == 4194305: # ESC
      get_tree().quit() 
    if event.pressed and event.keycode == 4194309: # ENTER
      get_tree().reload_current_scene()