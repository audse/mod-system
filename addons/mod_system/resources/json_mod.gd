class_name JsonMod extends Mod

@export var json_path: String = ""


func _init(json_path_value: String, json: Dictionary) -> void:
	json_path = json_path_value
	
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
	
	super._init()


func to_absolute_path(path: String) -> String:
	return (json_path.get_base_dir() + "/" + path).simplify_path()


func load_instance_script(path: String) -> ModScript:
	if not path.is_empty():
		var script := ModScript.load_script(path)
		if script and script.registered_class.has_ancestor(ModClassDB.get_by_name(&"ModInstanceScript")):
			return script
	return null


func load_asset(key: String, relative_path: String, type: String = "resource") -> ModAsset:
	var path := to_absolute_path(relative_path)
	match type.to_lower():
		"resource": return ModAsset.create(key, ModAsset.load_resource(path))
		"image": return ModAsset.create(key, ModAsset.load_image(path))
		_: return null



func get_identifier() -> String:
	return json_path
