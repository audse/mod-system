extends Node


## Handles loading and registering mods from the file system

## Emitted when started to load mods.
signal started_loading

## Emitted when all mods have been loaded and registered.
signal finished_loading


## If [code]true[/code], all mods have been loaded and registered.
var is_finished_loading: bool = false


func _ready() -> void:
	load_all_mods()


## Recursively finds all mod paths (must end in [code].mod.tres[/code] or [code].mod.json[/code])
## and loads/registers them (see [method load_mod] and [method ModSystem.install]).
func load_all_mods() -> void:
	is_finished_loading = false
	Array(ModSystemProjectSettings.get_mod_dirs()).map(load_mods_from_dir)
	is_finished_loading = true
	finished_loading.emit()


## Recursively finds all mod paths (must end in [code].mod.tres[/code] or [code].mod.json[/code])
## within the provided directory and loads/registers them (see [method load_mod] and 
## [method ModSystem.install]).
func load_mods_from_dir(dir_path: String) -> Array[Mod]:
	var mods: Array[Mod] = []
	for path in discover_mod_paths([dir_path]):
		if path.to_lower().get_extension() == "zip":
			mods.append_array(load_zipped_mods(path))
		else: mods.append(load_mod(path))
	return mods


## Loads all mods inside the given zip [code]path[/code].
func load_zipped_mods(path: String) -> Array[Mod]:
	var mods: Array[Mod] = []
	var base_path := path.get_base_dir()
	ModZipReader.read(
		path, 
		func(reader: ModZipReader, zipped_paths: PackedStringArray) -> Array[Mod]:
			var zipped_mods: Array[Mod] = []
			for zip_path in zipped_paths:
				if ModPath.is_mod_path(zip_path):
					var mod := load_mod(zip_path, ModContentLoader.new_zip(reader))
					if mod: zipped_mods.append(mod)
			return zipped_mods
	)
	return mods


## Loads a mod at the given [code]path[/code] and registers it (see [method ModSystem.install]).
func load_mod(path: String, loader := ModContentLoader.new()) -> Mod:
	var resource := loader.load_mod(path)
	if resource:
		ModSystem.install(resource)
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
