class_name DungeonBuilder2
extends Node

@onready var camera_2d: Camera2D = $Camera2D

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
		camera_2d.global_position -= event.relative
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			dragging_frame = true
		else: 
			dragging_frame = false
			

func _on_map_tile_2_button_down() -> void:
	dragging_tile = true


func _on_map_tile_2_button_up() -> void:
	dragging_tile = false
