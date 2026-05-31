class_name PlayeableTile2
extends TextureButton

## PlaceableTile is draggable while holding left click
## Double left click rotates Tile
## snaps back when released

@onready var tile_visualisation: TileVisualisation = $TileVisualisation
@onready var count: Label = $Count

var is_dragging = false

var snapback_pos : Vector2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snapback_pos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and is_dragging:
		position += event.relative

func _on_button_down() -> void:
	is_dragging = true

func _on_button_up() -> void:
	is_dragging = false
	var back_tween = create_tween()
	back_tween.tween_property(self, "position", snapback_pos, 0.1)
	# then also checking if the tile should be placed somewhere

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.double_click:
			tile_visualisation.rotateTile()
