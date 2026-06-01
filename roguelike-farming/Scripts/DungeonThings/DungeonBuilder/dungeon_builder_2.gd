class_name DungeonBuilder2
extends Node

@onready var camera_2d: Camera2D = $Camera2D
#@onready var background_for_test: Panel = $"Background for Test"

#selectable Tiles should be able 
var dragging_tile : bool = false

var dragging_frame : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event is InputEventMouseMotion and dragging_frame and !dragging_tile:
		camera_2d.global_position -= event.relative * (1/camera_2d.zoom.x)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			dragging_frame = true
		else: 
			dragging_frame = false
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			camera_2d.zoom += Vector2(0.1, 0.1)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			camera_2d.zoom += Vector2(-0.1, -0.1)




func _on_tile_selection_dragging_tile() -> void:
	dragging_tile = true

func _on_tile_selection_stopped_dragging_tile() -> void:
	dragging_tile = false
