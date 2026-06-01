class_name TileSelection2
extends CanvasLayer

@export var placable_tile: PackedScene

@onready var h_box_container: HBoxContainer = $Panel/HBoxContainer

signal draggingTile() 
signal stoppedDraggingTile()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	placeTiles()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func placeTiles() -> void: 
	for tile: Tile_Data in GlobalPlayerInventory.playerData.tileInventory.keys():
		var new_tile: PlayeableTile2 = placable_tile.instantiate()
		h_box_container.add_child(new_tile)
		new_tile.setTile(tile)
		
		new_tile.button_down.connect(sendingDraggingTile)
		new_tile.button_up.connect(sendingStoppedDraggingTile)
	pass
	
func sendingDraggingTile() -> void: 
	draggingTile.emit()
	
func sendingStoppedDraggingTile() -> void: 
	stoppedDraggingTile.emit()
