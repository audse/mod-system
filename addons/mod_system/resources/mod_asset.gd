class_name ModAsset extends Resource

## Contains a [String] identifier and a [Resource], loaded once per associated [Mod]
##
## A [ModAsset] is a named [Resource] that is loaded when a [Mod] is registered. That way, all
## instances of the mod share the same resource.
## [br][br]This is also helpful so that you can get assets by referencing the [member key] rather
## than worrying about loading/file paths.


## An identifier for this asset, should be unique to the containing [Mod].
@export var key: String

## Any resource file.
@export var asset: Resource


## Constructs a new [ModAsset] with a given key and asset.
static func create(key_value: String, asset_value: Resource) -> ModAsset:
	var mod_asset := ModAsset.new()
	mod_asset.key = key_value
	mod_asset.asset = asset_value
	return mod_asset


## Returns a [Resource] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
static func load_resource(path: String) -> Resource:
	if ResourceLoader.exists(path):
		return ResourceLoader.load(path)
	return null


## Returns a [Texture2D] containing the image at the given [code]path[/code], if it exists. 
## Otherwise, returns [code]null[/code].
## [br][br]This function also saves a new [code].import.tres[/code] file so that loading can be
## faster next time.
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
