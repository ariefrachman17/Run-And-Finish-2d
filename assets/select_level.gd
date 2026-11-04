extends Node2D



# Function to switch scenes
func _on_lvl_1_pressed() -> void:
		get_tree().change_scene_to_file("res://assets/level1.tscn")

func _on_lvl_2_pressed() -> void:
		get_tree().change_scene_to_file("res://assets/level2.tscn")

func _on_lvl_3_pressed() -> void:
		get_tree().change_scene_to_file("res://assets/level3.tscn")

func _on_lvl_4_pressed() -> void:
		get_tree().change_scene_to_file("res://assets/level4.tscn")

func _on_lvl_5_pressed() -> void:
		get_tree().change_scene_to_file("res://assets/level5.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/main_menu.tscn")

func _on_option_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/option.tscn")

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/tutorial.tscn")
