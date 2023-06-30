class_name Main extends Node2D


func _ready() -> void:
	ModSystem.enable_all()
	ModSystem.initialize(self)
