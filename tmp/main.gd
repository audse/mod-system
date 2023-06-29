extends Node2D


func _init() -> void:
	ModSystem.enable_all()
	pass


func _enter_tree() -> void:
	ModSystem.initialize(self, &"Main")
	

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	
	ModSystem.settings.are_mods_enabled = true
