@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("ModClassDB", "autoload/mod_class_db.gd")
	add_autoload_singleton("ModSystem", "autoload/mod_system.gd")
	add_autoload_singleton("ModLoader", "autoload/mod_loader.gd")
	
	ModSystemProjectSettings.update_project_settings()


func _exit_tree() -> void:
	remove_autoload_singleton("ModClassDB")
	remove_autoload_singleton("ModSystem")
	remove_autoload_singleton("ModLoader")
