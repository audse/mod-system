class_name ModContentLoader extends Resource

## Handles loading pretty much any files
##
## This class is sort of like [FileAccess] + [ResourceLoader] + [ZIPReader]. It handles loading
## resources, images, scripts, JSON, etc with a unified API. This helps to abstract file system
## stuff, as it can get overly complex accounting for all different loading methods.

enum Mode {
	FILE, ## The files to be loaded exist in the file system. All loading will be done with [FileAccess] and [ResourceLoader].
	ZIP, ## The files to be loaded exist in a zip file. All loading will be done with [ZIPreader].
}

## Defines the mode that files will be loaded.
var mode: Mode = Mode.FILE

## If not [code]null[/code], will be used to load files inside a ZIP.
var zip_reader: ModZipReader = null


## Returns a new [ModContentLoader] with the given [ModZipReader] and a [member mode] of [enum Mode.ZIP].
static func new_zip(reader: ModZipReader) -> ModContentLoader:
	var loader := ModContentLoader.new()
	loader.mode = Mode.ZIP
	loader.zip_reader = reader
	return loader


## Returns [code]true[/code] if a file exists at the given [code]path[/code].
func exists(path: String) -> bool:
	match mode:
		Mode.FILE: return FileAccess.file_exists(path)
		Mode.ZIP: return zip_reader.exists(path)
	return false


## Returns the [PackedByteArray] at the given [code]path[/code], if it exists. Otherwise, returns an empty [PackedByteArray].
func load_bytes(path: String) -> PackedByteArray:
	match mode:
		Mode.FILE: return FileAccess.get_file_as_bytes(path)
		Mode.ZIP: return zip_reader.read_file(path)
	return PackedByteArray([])


## Returns a [String] at the given [code]path[/code], if it exists. Otherwise, returns an empty [String].
func load_string(path: String) -> String:
	match mode:
		Mode.FILE: return FileAccess.get_file_as_string(path)
		Mode.ZIP: return zip_reader.read_string(path)
	return ""


## Returns a JSON [Dictionary] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
func load_json(path: String) -> Dictionary:
	return JSON.parse_string(load_string(path))


## Returns a [Resource] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
func load_resource(path: String) -> Resource:
	match mode:
		Mode.FILE: 
			if "res://" in path: return load(path)
			return ResourceLoader.load(path)
		Mode.ZIP: return zip_reader.read_resource(path)
	return null


## Returns a [Script] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
func load_script(path: String) -> Script:
	match mode:
		Mode.FILE: 
			var resource := load_resource(path)
			if resource != null and resource is Script:
				return resource
		Mode.ZIP: return zip_reader.read_script(path)
	return null


## Returns a [Texture2D] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
func load_image(path: String) -> Texture2D:
	match mode:
		Mode.FILE:
			var resource := load_resource(path)
			if resource != null and resource is Texture2D:
				return resource
		Mode.ZIP: return zip_reader.read_image(path)
	return null


## Returns a [Mod] at the given [code]path[/code], if it exists. Otherwise, returns [code]null[/code].
func load_mod(path: String) -> Mod:
	if exists(path):
		var ext := ModPath.get_extension(path)
		if ext in ["mod.res", "mod.tres"]:
			var resource = load_resource(path)
			if resource and resource is Mod:
				return resource
		elif ext in ["mod.json"]:
			var json := load_json(path)
			return JsonMod.new(path, json, self)
	return null
