extends Node

@onready var creator: Creator = get_tree().get_root().get_node("Main/%Creator")
@onready var placer: Placer = get_tree().get_root().get_node("Main/%Placer")
@onready var ui: UI = get_tree().get_root().get_node("Main/%UI")
@onready var player: Player = get_tree().get_root().get_node("Main/%Player")
@onready var level_manager: LevelManager = get_tree().get_root().get_node("Main/%LevelManager")
