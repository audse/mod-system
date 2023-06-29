extends Node


func _init() -> void:
	load_all_mods()


func load_all_mods() -> void:
	get_mod_paths(get_mod_dirs()).map(load_mod)


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


func get_mod_dirs() -> Array[String]:
	var dirs: Array[String] = []
	for dir in ModSystemUtils.get_setting(ModSystemUtils.Settings.ModPath).split(","):
		dirs.append(dir.strip_edges().simplify_path())
	return dirs


func is_mod_path(path: String) -> bool:
	return path.ends_with(".mod.tres") or path.ends_with(".mod.json")
