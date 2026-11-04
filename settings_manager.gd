extends Node

var _volume: float = 0.8 # Default 80%

func get_volume_value() -> float:
	return _volume

func set_volume_value(value: float) -> void:
	_volume = clamp(value, 0.0, 1.0)
	# Simpan ke file jika mau persistent
