extends Node

func _ready() -> void:
	update_unlock_ui()

func update_unlock_ui() -> void:
	for i in range(2, 6): # lvl2..lvl5
		var lock_holder := get_node_or_null("lvl%d" % i) as Control
		if lock_holder == null:
			continue

		var is_unlocked = i <= Global.unlocked_max_level

		# kalau sudah unlock, panel lock-nya hilang
		lock_holder.visible = not is_unlocked
