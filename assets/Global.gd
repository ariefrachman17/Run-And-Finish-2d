extends Node

var score: int = 0
var is_dead: bool = false
var unlocked_max_level: int = 1

var current_level_index: int = 1  # level yang sedang dimainkan

var level_paths := [
	"res://assets/level1.tscn",
	"res://assets/level2.tscn",
	"res://assets/level3.tscn",
	"res://assets/level4.tscn",
	"res://assets/level5.tscn",
]
