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
