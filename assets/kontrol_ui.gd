extends Node

@onready var level_complete_panel: Control = $LevelComplete/levelcomplete
@onready var game_over_panel: Control = $GameOver/GameOver

@onready var level_complete_ctrl = $LevelComplete
@onready var game_over_ctrl = $GameOver

func _ready() -> void:
	level_complete_panel.visible = false
	game_over_panel.visible = false

func show_level_complete(score: int) -> void:
	print("[kontrolUI] score masuk=", score)

	var tier := 1
	if score < 50:
		tier = 1
	elif score < 100:
		tier = 2
	else:
		tier = 3

	print("[kontrolUI] tier=", tier)

	level_complete_ctrl.set_stars(tier, score)


func show_game_over() -> void:
	Global.is_dead = true
	level_complete_panel.visible = false
	game_over_panel.visible = true
	game_over_ctrl.set_info(Global.score)
