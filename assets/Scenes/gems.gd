extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player1" or body.name == "Player2":
		game_manager.add_point()
		
		
		AudioManager.play_sound_effect("res://assets/7 Levels/coin.wav")
		
		queue_free()
