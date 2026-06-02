class_name GridTile
extends TextureButton

## Seperate Tile for Grid because of different logic. 
## This tile does not move. 
## Should rotate on left click
## Should remove tile_data upon right click

@onready var tile_visualisation: TileVisualisation = $TileVisualisation

@export var generated_tile : bool = false
@export var tile_data: Tile_Data:
	set(new_tile):
		tile_data = new_tile
		tile_visualisation.updateVisualisation(tile_data)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setTile(new_data: Tile_Data) -> void:
	tile_data = new_data
	tile_data.rotatedTile.connect(updateVisualisation)

func updateVisualisation() -> void: 
	tile_visualisation.updateVisualisation(tile_data)

func _on_gui_input(event: InputEvent) -> void: 
	if event is InputEventMouseButton and event.is_pressed() and !generated_tile:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				if tile_data:
					print("should Rotate now")
					tile_data.rotateTile()
			MOUSE_BUTTON_RIGHT:
				tile_data = null
