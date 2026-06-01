class_name GameManager
extends Node

## This script is kind of the brain of the game. 
## It contains the current state of the game. 
## Also some needed infos like the build dungeon. 

signal gamestateChanged(new_state: GAMESTATE)

#so when new state is set, the signal gets emitted automatically
@export var current_state: GAMESTATE:
	set(new_state):
		current_state = new_state
		gamestateChanged.emit(new_state)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


enum GAMESTATE {
	START_SCREEN,
	CHARACTER_CREATOR,
	BASE,
	DUNGEON_BUILDER,
	DUNGEON_TRAVERSAL,
	SKILL_TREE
}

##should also check if the scene can be swtch to this one. 
func changeToGameState(new_state: GAMESTATE) -> void:
	current_state = new_state
