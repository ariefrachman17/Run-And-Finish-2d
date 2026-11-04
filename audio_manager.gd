extends Node

var music_stream: AudioStream
var audio_player: AudioStreamPlayer2D
var audio_bus_id: int
var current_music: String = ""
var level_music: String = ""

func _ready():
	audio_player = AudioStreamPlayer2D.new()
	add_child(audio_player)
	
	audio_bus_id = AudioServer.get_bus_index("Master")
	var saved_volume = SettingsManager.get_volume_value()  
	set_volume(saved_volume)

func play_music(music_path: String) -> void:
	if current_music == music_path:
		return
	
	current_music = music_path
	level_music = music_path
	music_stream = load(music_path)
	audio_player.stream = music_stream
	audio_player.play()

# ← GANTI INI (hapus await)
func play_sound_effect(sound_path: String) -> void:
	var sfx_player = AudioStreamPlayer2D.new()
	add_child(sfx_player)
	sfx_player.stream = load(sound_path)
	sfx_player.play()
	
	# Hapus auto setelah 10 detik (biar aman)
	await get_tree().create_timer(10.0).timeout
	sfx_player.queue_free()

func pause_music() -> void:
	audio_player.stream_paused = true

func resume_music() -> void:
	audio_player.stream_paused = false

func stop_music() -> void:
	audio_player.stop()

func reset_audio() -> void:
	current_music = ""
	if level_music != "":
		play_music(level_music)

func set_volume(value: float) -> void:
	var normalized_volume = clamp(value, 0.0, 1.0)
	var db = linear_to_db(normalized_volume)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	audio_player.volume_db = db
