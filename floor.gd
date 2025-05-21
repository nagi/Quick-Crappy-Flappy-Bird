extends StaticBody2D

const FLOOR_SPEED = 180
var floor_tiles = []
var tile_width
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tile_width = $mud_0.get_rect().size.x
	floor_tiles = [$mud_0, $mud_1, $mud_2]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for tile in floor_tiles:
		tile.position.x -= FLOOR_SPEED * delta
		if tile.position.x + tile_width < 0:
			tile.position.x += (tile_width * 3)
 
