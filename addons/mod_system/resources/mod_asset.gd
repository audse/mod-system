class_name ModAsset extends Resource

@export var key: String
@export var asset: Resource


static func create(key_value: String, asset_value: Resource) -> ModAsset:
	var asset := ModAsset.new()
	asset.key = key_value
	asset.asset = asset_value
	return asset


static func load_resource(path: String) -> Resource:
	if ResourceLoader.exists(path):
		return ResourceLoader.load(path)
	return null


static func load_image(path: String) -> Texture2D:
	# Try to load in project files
	if path.begins_with("res://"):
		return load(path)
	
	var imported_path: String = ModSystemUtils.get_imported_path(path)
	
	# Try to load already-imported resource
	if ResourceLoader.exists(imported_path):
		return ResourceLoader.load(imported_path)
	
	# Load as new resource
	if FileAccess.file_exists(path):
		var image := Image.load_from_file(path)
		var texture := ImageTexture.create_from_image(image)
		
		# Save imported resource for future use
		texture.resource_path = imported_path
		ResourceSaver.save(texture)
		
		return texture
	return null
