extends Node

@onready var panel: Control = $levelcomplete
@onready var star_1: Sprite2D = $levelcomplete/star1
@onready var star_2: Sprite2D = $levelcomplete/star2
@onready var star_3: Sprite2D = $levelcomplete/star3
@onready var label: Label = $levelcomplete/score

func _ready() -> void:
	panel.visible = false
	star_1.visible = false
	star_2.visible = false
	star_3.visible = false

func set_stars(tier: int, score: int) -> void:
	print("[LevelComplete] tier=", tier, " score=", score)
	panel.visible = true
	label.text = "Score : %d"% score
	star_1.visible = (tier == 1)
	star_2.visible = (tier == 2)
	star_3.visible = (tier == 3)

func _on_next_pressed() -> void:
	Global.score = 0
	
	var next_index = Global.current_level_index + 1
	if next_index > Global.level_paths.size():
		get_tree().change_scene_to_file("res://assets/select_level.tscn")
		return
	Global.unlocked_max_level = max(Global.unlocked_max_level, next_index)
	Global.current_level_index = next_index
	get_tree().change_scene_to_file(Global.level_paths[next_index - 1])

func _on_menu_pressed() -> void:
	Global.score = 0
	
	# ← TAMBAH INI
	AudioManager.stop_music()
	
	get_tree().change_scene_to_file("res://assets/select_level.tscn")

func _on_repeat_pressed() -> void:
	Global.score = 0
	
	# ← TAMBAH INI
	AudioManager.reset_audio()
	
	get_tree().reload_current_scene()
