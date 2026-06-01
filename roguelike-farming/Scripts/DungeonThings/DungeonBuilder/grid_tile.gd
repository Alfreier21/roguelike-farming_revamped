class_name GridTile
extends TextureButton

## Seperate Tile for Grid because of different logic. 
## This tile does not move. 
## Should rotate on left click
## Should remove tile_data upon right click

@onready var tile_visualisation: TileVisualisation = $TileVisualisation

@export var generated_tile : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setTile(tile_data: Tile_Data) -> void:
	tile_visualisation.setTile(tile_data)
