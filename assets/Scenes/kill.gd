extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node) -> void:
	if Global.is_dead:
		return

	if body.name != "Player" and body.name != "Player1" and body.name != "Player2":
		return

	print("You died!")
	Global.is_dead = true

	# Slow motion sebentar
	Engine.time_scale = 0.5

	# Hapus collision player dengan aman
	var collision_shape = body.get_node_or_null("CollisionShape2D")
	if collision_shape:
		collision_shape.call_deferred("queue_free")
	
	
	
	# Tampilkan UI GameOver
	var ui = get_tree().current_scene.get_node_or_null("UI/kontrolUI")
	if ui:
		ui.show_game_over()
	else:
		print("UI/kontrolUI tidak ketemu")

	# Opsional: setelah 0.8 detik, stop total (biar game freeze tapi UI tetap tampil)
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 0.0
