class_name SceneManager2
extends Node

const character_creator_scene = "res://Scenes/character_creator.tscn"
const base = "res://Scenes/farming_base.tscn"
const dungeon_builder = "res://Scenes/DungeonThings/DungeonBuilder/dungeon_builder_2.tscn"
const skill_tree = "res://skillTree.tscn"
const dungeon_traversal = "res://Scenes/DungeonThings/dungeon_manager.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game2.gamestateChanged.connect(changeSceneAccordingToGamestate)
	pass # Replace with function body.


func changeSceneAccordingToGamestate(state: GameManager.GAMESTATE) -> void:
	match state:
		GameManager.GAMESTATE.START_SCREEN:
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
		GameManager.GAMESTATE.CHARACTER_CREATOR:
			get_tree().change_scene_to_file(character_creator_scene)
		GameManager.GAMESTATE.BASE:
			get_tree().change_scene_to_file(base)
		GameManager.GAMESTATE.DUNGEON_BUILDER:
			get_tree().change_scene_to_file(dungeon_builder)
		GameManager.GAMESTATE.SKILL_TREE:
			get_tree().change_scene_to_file(skill_tree)
		GameManager.GAMESTATE.DUNGEON_TRAVERSAL:
			get_tree().change_scene_to_file(dungeon_traversal)
