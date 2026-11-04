extends Node

@onready var panel: Control = $GameOver
@onready var score_label: Label = $GameOver/score

func _ready() -> void:
	panel.visible = false
	
func set_info(score_value: int) -> void:
	panel.visible = true
	score_label.text = "  Score : %d" % score_value

func _on_repeat_pressed() -> void:
	Engine.time_scale = 1.0
	Global.is_dead = false
	Global.score = 0
	

	AudioManager.reset_audio()
	AudioManager.play_music("res://assets/7 Levels/menu.mp3")
	
	get_tree().reload_current_scene()

func _on_menu_pressed() -> void:
	Global.score = 0
	
	get_tree().change_scene_to_file("res://assets/select_level.tscn")
