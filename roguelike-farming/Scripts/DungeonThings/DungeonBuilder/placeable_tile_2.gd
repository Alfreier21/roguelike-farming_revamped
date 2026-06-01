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


func setTile(data: Tile_Data) -> void:
	tile_visualisation.setTile(data)

	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and is_dragging:
		position += event.relative

func _on_button_down() -> void:
	snapback_pos = position
	print("Got signal")
	is_dragging = true

func _on_button_up() -> void:
	is_dragging = false
	var back_tween = create_tween()
	back_tween.tween_property(self, "position", snapback_pos, 0.1)
	getGridTile()
	# then also checking if the tile should be placed somewhere

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.double_click:
			tile_visualisation.rotateTile()

func getGridTile() -> void: 
	var mouse_pos = get_viewport().get_mouse_position()
	var space = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = mouse_pos
	query.collide_with_areas = true
	var everything = space.intersect_point(query)
	for slot in space.intersect_point(query):
		var s: GridTile = slot.collider.get_parent() as GridTile
		if s != null:
			#logic to place the specific tile
			print("Found free grid Space")
