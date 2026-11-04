extends Node2D


func _on_back_2_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/main_menu.tscn")
