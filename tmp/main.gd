extends Node2D


func _init() -> void:
	ModSystem.enable_all()


func _enter_tree() -> void:
	ModSystem.initialize(self, &"Main")
