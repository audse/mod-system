class_name ModPath extends Object

## Utilities to help with mod file system paths

## A [RegEx] that captures three groups from a file path (e.g. [code]my_mod.mod.json[/code]):
## [br]1. [code]ext[/code] - the full extension (e.g. [code]mod.json[/code])
## [br]2. [code]sub_ext[/code] - the sub extension, if it exists (e.g. [code]mod[/code])
## [br]3. [code]main_ext[/code] - the main extension (e.g. [code]json[/code])
static var ExtensionRegEx := RegEx.create_from_string("\\.(?<ext>((?<sub_ext>[^.\\/]+)\\.)?(?<main_ext>[^\\/.]+))$")


## Returns the [b]extended[/b] extension of the given path.
## [br]Examples:
## [codeblock]
## assert(ModPath.get_extension("my_mod.mod.json") == "mod.json")
## assert(ModPath.get_extension("my_mod.tres") == "tres")
## [/codeblock]
static func get_extension(path: String) -> String:
	var result := ModPath.ExtensionRegEx.search(path.to_lower())
	if result: return result.get_string(result.names.get("ext"))
	else: return path.get_extension()


## Returns [code]true[/code] if the given [code]path[/code] is in the format
## [code]*.mod.tres[/code], [code]*.mod.res[/code], or [code]*.mod.json[/code]
static func is_mod_path(path: String) -> bool:
	var ext := ModPath.get_extension(path)
	return (
		not path.get_file().begins_with(".") 
		and ext in ["mod.tres", "mod.res", "mod.json", "mod.zip"]
	)


## Returns a new path with extension [code].import.tres[/code]
static func to_import_path(path: String) -> String:
	return path.replace(path.get_extension(), "import.tres").simplify_path()
