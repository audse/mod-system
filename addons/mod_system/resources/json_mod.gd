class_name JsonMod extends Mod

## A [Mod] that is created by loading data from a JSON [Dictionary]
##
## See [Mod] for more information.

## The path to the JSON file from which this mod was created.
@export var json_path: String = ""

var loader: ModContentLoader = null


func _init(json_path_value: String, json: Dictionary, loader_value := ModContentLoader.new()) -> void:
	json_path = json_path_value
	loader = loader_value
	
	# Gameplay
	requires_restart = json.get("requires_restart", false)
	is_cheat = json.get("is_cheat", false)
	grantable_owners = PackedStringArray(json.get("grantable_owners", []))
	
	# Script
	var instance_script_path: String = json.get("instance_script", "")
	if not instance_script_path.is_empty():
		instance_script = load_instance_script(to_absolute_path(instance_script_path))
	
	# Assets
	var asset_dicts: Array = json.get("assets", [])
	for asset_dict in asset_dicts:
		var asset := load_asset(
			asset_dict.get("key", ""),
			asset_dict.get("asset", ""),
			asset_dict.get("type", "resource")
		)
		if asset: assets.append(asset)
	
	# Metadata
	var meta: Dictionary = json.get("meta", {})
	name = meta.get("name", "")
	author = meta.get("author", "")
	version = meta.get("version", "")
	url = meta.get("url", "")
	
	var thumbnail_path: String = meta.get("thumbnail", "")
	if not thumbnail_path.is_empty():
		thumbnail = loader.load_image(to_absolute_path(thumbnail_path))
	
	super._init()


## Returns an absolute file path from a path relative to [member json_path].
## e.g. [code]some_asset.png[/code] becomes [code]user://mods/my_mod/some_asset.png[/code]
func to_absolute_path(path: String) -> String:
	return (json_path.get_base_dir() + "/" + path).simplify_path()


## Loads a script (extending [ModInstanceScript]) at the given path and returns a new [ModScript].
func load_instance_script(path: String) -> ModScript:
	if not path.is_empty():
		var loaded_script := loader.load_script(path)
		if loaded_script:
			var script: ModScript = ModScript.new(loaded_script)
			if script and script.registered_class.has_ancestor(ModClassDB.get_by_name(&"ModInstanceScript")):
				return script
	return null


## Loads an asset at [code]relative_path[/code] and returns a new [ModAsset].
## [code]type[/code] can be one of [code]["resource", "image"][/code]
func load_asset(key: String, relative_path: String, type: String = "resource") -> ModAsset:
	var path := to_absolute_path(relative_path)
	match type.to_lower():
		"resource": return ModAsset.create(key, loader.load_resource(path))
		"image": return ModAsset.create(key, loader.load_image(path))
		_: return null


## Returns a [String] that idenitifies this mod, usually the file path
func get_identifier() -> String:
	return json_path


func _to_string() -> String:
	return "<Mod:{0}[\"{1}\"]>".format([name, json_path])
