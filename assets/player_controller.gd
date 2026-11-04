extends CharacterBody2D
class_name PlayerController

const SPEED = 50.0
const JUMP_VELOCITY = -250.0

var direction: float = 0.0

var has_jumped_once: bool = false
var is_double_jumping: bool = false
var is_wall_jumping: bool = false

func _physics_process(delta: float) -> void:

	# Reset flags saat menyentuh lantai
	if is_on_floor():
		has_jumped_once = false
		is_double_jumping = false
		is_wall_jumping = false

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# --- JUMP ---
	if Input.is_action_just_pressed("ui_accept"):

		# 1. Normal jump
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			has_jumped_once = true

		# 2. WALL JUMP (contoh sederhana)
		elif is_on_wall():
			velocity.y = JUMP_VELOCITY
			velocity.x = -get_wall_normal().x * SPEED * 1.5
			is_wall_jumping = true

		# 3. DOUBLE JUMP
		elif has_jumped_once and not is_double_jumping:
			velocity.y = JUMP_VELOCITY
			is_double_jumping = true

	# --- MOVEMENT ---
	direction = Input.get_axis("ui_a", "ui_d")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
