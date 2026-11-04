extends Node2D

# Gunakan CharacterBody2D agar lebih fleksibel kalau belum set class_name
@export var player_controller: CharacterBody2D
@export var sprite: AnimatedSprite2D

func _process(_delta):
	# Safety check: Pastikan node sudah dimasukkan di Inspector
	if not player_controller or not sprite:
		return

	# 1. LOGIKA FLIP (Kiri/Kanan)
	# Kita cek velocity.x saja (lebih aman daripada variabel direction manual)
	# Jika bergerak ke kiri (negatif), flip true. Jika ke kanan (positif), flip false.
	if player_controller.velocity.x < -0.1:
		sprite.flip_h = true
	elif player_controller.velocity.x > 0.1:
		sprite.flip_h = false
	# Jika 0 (diam), dia tetap menghadap arah terakhir (tidak berubah)

	# 2. STATE CHECK UNTUK ANIMASI
	var anim_to_play = "idle" # Default animation

	# Cek Wall Jump (Pastikan logic 'touching_wall' ada di script playermu, atau gunakan is_on_wall())
	# Disini saya gunakan 'get("touching_wall")' agar tidak crash jika variabelnya lupa dibuat
	if player_controller.get("touching_wall") and not player_controller.is_on_floor():
		anim_to_play = "wall_jump"

	# Cek Double Jump
	elif player_controller.get("is_double_jumping") == true and not player_controller.is_on_floor():
		anim_to_play = "double_jump"

	# Lompat (Naik)
	elif player_controller.velocity.y < 0 and not player_controller.is_on_floor():
		anim_to_play = "jump"

	# Jatuh (Turun)
	elif player_controller.velocity.y > 0 and not player_controller.is_on_floor():
		if player_controller.get("is_double_jumping") == false: 
			anim_to_play = "fall"
		

	# Lari (Cek kecepatan horizontal)
	elif abs(player_controller.velocity.x) > 10.0: # Angka 10.0 adalah toleransi kecil
		anim_to_play = "run"
	
	# Idle (Otomatis terpilih jika kondisi di atas tidak terpenuhi)

	# 3. JALANKAN ANIMASI
	play_animation(anim_to_play)


func play_animation(anim_name: String):
	# Di Godot 4, cukup panggil play(). 
	# Godot otomatis mengecek jika animasi yang sama sedang jalan, dia tidak akan merestart-nya.
	sprite.play(anim_name)
