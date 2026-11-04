extends Area2D

@export var player_names := ["Player", "Player1", "Player2"]
@export var current_level_index: int = 1  # isi per level: level1=1, level2=2, dst

func _on_body_entered(body: Node) -> void:
	if body.name in player_names:
		if Global.is_dead:
			return
		
		AudioManager.play_sound_effect("res://assets/7 Levels/Champion.mp3")
		
		# unlock next level
		Global.unlocked_max_level = max(Global.unlocked_max_level, current_level_index + 1)

		# tampilkan LevelComplete
		var ui = get_tree().current_scene.get_node_or_null("UI/kontrolUI")
		if ui:
			ui.show_level_complete(Global.score)
