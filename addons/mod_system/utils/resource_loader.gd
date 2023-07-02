class_name ModSystemResourceLoader extends Object

## Handles mod system-specific resource loading

## Saves a new [Resource] as a `.import.tres` file based on the [code]original_path[/code].
static func save_as_imported(resource: Resource, original_path: String) -> void:
	var imported_path: String = ModPath.to_import_path(original_path)
	resource.resource_path = imported_path
	ResourceSaver.save(resource)


## Returns a [Resource] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
static func load_resource(path: String) -> Resource:
	if ResourceLoader.exists(path):
		return ResourceLoader.load(path)
	return null


## Returns a [Texture2D] containing the image at the given [code]path[/code], if it exists. 
## Otherwise, returns [code]null[/code].
## [br][br]If [code]save_imported[/code] is [code]true[/code], this function also saves a new 
## [code].import.tres[/code] file so that loading can be faster next time.
static func load_image(path: String, save_imported: bool = false) -> Texture2D:
	# Try to load in project files
	if path.begins_with("res://"):
		return load(path)
	
	var imported_path: String = ModPath.to_import_path(path)
	
	# Try to load already-imported resource
	var resource := ModSystemResourceLoader.load_resource(imported_path)
	if resource != null: return resource
	
	# Load as new resource
	if FileAccess.file_exists(path):
		var image := Image.load_from_file(path)
		var texture := ImageTexture.create_from_image(image)
		
		# Save imported resource for future use
		ModSystemResourceLoader.save_as_imported(texture, path)
		
		return texture
	return null


## Loads a JSON dictionary at the given [code]path[/code].
static func load_json(path: String) -> Dictionary:
	if FileAccess.file_exists(path):
		var file := FileAccess.get_file_as_string(path)
		var json: Dictionary = JSON.parse_string(file)
		return json
	return {}


## Creates a [JsonMod] from the JSON dictionary at the given [code]path[/code].
static func load_json_mod(path: String) -> JsonMod:
	if FileAccess.file_exists(path):
		var json := ModSystemResourceLoader.load_json(path)
		return JsonMod.new(path, json)
	else: return null


## Loads a mod at the given [code]path[/code].
static func load_mod(path: String) -> Mod:
	var ext := ModPath.get_extension(path)
	if ext in ["mod.res", "mod.tres"]:
		var resource = ModSystemResourceLoader.load_resource(path)
		if resource and resource is Mod:
			return resource
	elif ext in ["mod.json"]:
		return ModSystemResourceLoader.load_json_mod(path)
	return null
