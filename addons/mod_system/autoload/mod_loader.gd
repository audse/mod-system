extends Node


## Handles loading and registering mods from the file system

## Emitted when all mods have been loaded and registered
signal finished_loading

## If [code]true[/code], all mods have been loaded and registered
var is_finished_loading: bool = false


func _ready() -> void:
	load_all_mods()


## Recursively finds all mod paths (must end in [code].mod.tres[/code] or [code].mod.json[/code])
## and loads/registers them (see [method load_mod] and [method ModSystem.register]).
func load_all_mods() -> void:
	discover_mod_paths(ModSystemProjectSettings.get_mod_dirs()).map(load_mod)
	is_finished_loading = true
	finished_loading.emit()


## Loads a mod at the given [code]path[/code] and registers it (see [method ModSystem.register]).
func load_mod(path: String) -> Mod:
	var resource := ModSystemResourceLoader.load_mod(path)
	if resource:
		ModSystem.register(resource)
		return resource
	return null


## Returns an [Array][[String]] of all mod paths (e.g. paths ending in [code].mod.tres[/code] or [code].mod.json[/code])
## within the directories listed in [member ProjectSettings."mod_system/mod_paths"].
func discover_mod_paths(dirs: Array[String]) -> Array[String]:
	var paths: Array[String] = []
	for dir in dirs:
		# Make sure directory exists
		if not DirAccess.dir_exists_absolute(dir):
			DirAccess.make_dir_recursive_absolute(dir)
		# Get mod paths from subidrectories (recursive)
		for subdir in DirAccess.get_directories_at(dir):
			paths.append_array(discover_mod_paths([dir.path_join(subdir)]))
		# Get mod paths in current directory
		for file in DirAccess.get_files_at(dir):
			if ModPath.is_mod_path(file): paths.append(dir.path_join(file))
	return paths
