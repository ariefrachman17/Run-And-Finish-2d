extends Node2D

@export var player_controller: PlayerController
@export var sprite: AnimatedSprite2D

func _process(_delta):
	if player_controller == null or sprite == null:
		return

	# --- Flip kiri-kanan ---
	if player_controller.direction > 0:
		sprite.flip_h = false
	elif player_controller.direction < 0:
		sprite.flip_h = true

	# --- PRIORITAS ANIMASI ---

	# 1. WALL JUMP
	if player_controller.is_wall_jumping:
		play_animation("wall_jump")
		return

	# 2. DOUBLE JUMP
	if player_controller.is_double_jumping:
		play_animation("double_jump")
		return

	# 3. JUMP
	if player_controller.velocity.y < 0.0:
		play_animation("jump")
		return

	# 4. FALL
	if player_controller.velocity.y > 0.0 and not player_controller.is_on_floor():
		play_animation("fall")
		return

	# 5. RUN
	if abs(player_controller.velocity.x) > 0.1:
		play_animation("run")
		return

	# 6. IDLE
	play_animation("idle")


# --- Fungsi play_animation Godot 4 ---
func play_animation(anim_name: String):
	if sprite.animation != anim_name:
		sprite.animation = anim_name
		sprite.play()
