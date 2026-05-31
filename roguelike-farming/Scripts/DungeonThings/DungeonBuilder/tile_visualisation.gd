class_name TileVisualisation
extends Node2D

@export var tile_data : Tile_Data

@onready var background: Sprite2D = $background
@onready var north: Sprite2D = $north
@onready var east: Sprite2D = $east
@onready var south: Sprite2D = $south
@onready var west: Sprite2D = $west
@onready var extra: Sprite2D = $extra

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setTile(data: Tile_Data) -> void: 
	tile_data = data
	createVisualisation() 

func rotateTile() -> void: 
	tile_data.rotateTile()


func resetTileVisualisation() -> void:
	tile_data = null
	background.texture = preload("uid://c4mux65qg06i2")
	removeAllEntrances()

func createVisualisation() -> void:
	showEntrances()
	showExtras()
	background.texture = tile_data.tileStyle.previewTileBackground
	pass

func showEntrances() -> void: 
	removeAllEntrances()
	if (tile_data.isNorth()):
		north.visible = true
	if(tile_data.isEast()):
		east.visible = true
	if(tile_data.isSouth()):
		south.visible = true
	if(tile_data.isWest()):
		west.visible = true
	pass

func removeAllEntrances() -> void: 
	north.visible = false
	east.visible = false
	south.visible = false
	west.visible = false

func showExtras() -> void:
	if tile_data.extras != []: 
		extra.texture = tile_data.extras[0].previewSprite
		extra.visible = true
