extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if Global.is_dead:
		return

	if body.name == "Player" or body.name == "Player1" or body.name == "Player2":
		print("You died!")
		Global.is_dead = true
		Engine.time_scale = 0.5

		var collision_shape = body.get_node_or_null("CollisionShape2D")
		if collision_shape:
			AudioManager.play_music("res://assets/7 Levels/game_over.mp3")
			collision_shape.call_deferred("queue_free")

		var ui = get_tree().current_scene.get_node_or_null("UI/kontrolUI")
		if ui:
			ui.show_game_over()
		else:
			print("UI/kontrolUI tidak ketemu")

		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 0.0
