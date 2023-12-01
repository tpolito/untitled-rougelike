extends TileMap

@export var world_seed := 0

const TREE := 0
const GRASS := 2
const BUSH := 4

var rng = RandomNumberGenerator.new()
var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 128
var height = 128

func _ready() -> void:
  rng.randomize()
  moisture.seed = world_seed if world_seed != 0 else randi()
  temperature.seed = world_seed if world_seed != 0 else randi()
  altitude.seed =  world_seed if world_seed != 0 else randi()
  altitude.frequency = 0.005
  generate_chunk()

func _process(_delta: float) -> void:
  # generate_chunk()
  pass

func generate_chunk() -> void:
  var tile_pos = local_to_map(Vector2(50 , 50))
  for x in range(width):
    for y in range(height):
      # var moist = moisture.get_noise_2d(tile_pos.x - width / 2 + x, tile_pos.y - height / 2 + y)
      var rand = rng.randf_range(0, 100)
      if rand > 90:
        set_cell(0, Vector2(x,y), 0, Vector2(0, TREE))
      elif rand > 60 and rand < 70:
        set_cell(0, Vector2(x,y), 0, Vector2(0, GRASS))

func _input(event): 
  if event is InputEventKey:
    # TODO: Is there a better way to get this aside from these arcane codes
    if event.pressed and event.keycode == 4194305: # ESC
      get_tree().quit() 
    if event.pressed and event.keycode == 4194309: # ENTER
      get_tree().reload_current_scene()