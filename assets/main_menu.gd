extends Node2D

func _ready():
	AudioManager.play_music("res://assets/7 Levels/menu.mp3")
	
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/select_level.tscn")
	
func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/option.tscn")
#
#
func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/credit.tscn")
#
#
func _on_exit_pressed() -> void:
	get_tree().quit()
