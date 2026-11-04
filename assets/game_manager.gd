extends Node

@export var point_value: int = 10
@onready var points_label: Label = $"../UI/Panel/PointsLabel" # sesuaikan path

func add_point() -> void:
	Global.score += point_value
	points_label.text = str(Global.score)
