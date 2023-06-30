extends Node


## Handles loading and registering mods from the file system


func _ready() -> void:
	load_all_mods()


## Recursively finds all mod paths (must end in [code].mod.tres[/code] or [code].mod.json[/code])
## and loads/registers them (see [method load_mod] and [method ModSystem.register]).
func load_all_mods() -> void:
	get_mod_paths(get_mod_dirs()).map(load_mod)


## Loads a mod at the given [code]path[/code] and registers it (see [method ModSystem.register]).
func load_mod(path: String) -> Mod:
	if path.ends_with(".mod.tres"):
		var resource = ResourceLoader.load(path)
		if resource and resource is Mod: 
			ModSystem.register(resource)
			return resource
	elif path.ends_with(".mod.json"):
		var file := FileAccess.get_file_as_string(path)
		var json := JSON.parse_string(file)
		var mod: JsonMod = JsonMod.new(path, json)
		ModSystem.register(mod)
		return mod
	return null


## Returns an [Array][[String]] of all mod paths (e.g. paths ending in [code].mod.tres[/code] or [code].mod.json[/code])
## within the directories listed in [member ProjectSettings."mod_system/mod_paths"].
func get_mod_paths(dirs: Array[String]) -> Array[String]:
	var paths: Array[String] = []
	for dir in dirs:
		# Make sure directory exists
		if not DirAccess.dir_exists_absolute(dir):
			DirAccess.make_dir_recursive_absolute(dir)
		# Get mod paths from subidrectories (recursive)
		for subdir in DirAccess.get_directories_at(dir):
			paths.append_array(get_mod_paths([dir.path_join(subdir)]))
		# Get mod paths in current directory
		for file in DirAccess.get_files_at(dir):
			if is_mod_path(file): paths.append(dir.path_join(file))
	return paths


## Returns an [Array][[String]] of all directories listed in [member ProjectSettings."mod_system/mod_paths"].
func get_mod_dirs() -> Array[String]:
	var dirs: Array[String] = []
	for dir in ModSystemUtils.get_setting(ModSystemUtils.Settings.ModPath).split(","):
		dirs.append(dir.strip_edges().simplify_path())
	return dirs


## If [code]true[/code], the [code]path[/code] is in the format [code]*.mod.tres[/code] or [code]*.mod.json[/code].
func is_mod_path(path: String) -> bool:
	return path.ends_with(".mod.tres") or path.ends_with(".mod.json")
