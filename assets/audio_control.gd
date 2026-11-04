extends HSlider

@export var audio_bus_name: String = "Master"

func _ready() -> void:
	# Set range slider ke 0.0 - 1.0
	min_value = 0.0
	max_value = 1.0
	step = 0.01
	
	# Ambil nilai volume yang disimpan
	var saved_volume = SettingsManager.get_volume_value()
	value = saved_volume
	
	
	# Set volume awal
	AudioManager.set_volume(saved_volume)

func _on_value_changed(new_value: float) -> void:
	# Simpan nilai
	SettingsManager.set_volume_value(new_value)
	
	# Ubah volume
	AudioManager.set_volume(new_value)
