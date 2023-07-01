@tool
class_name ModSettings extends Resource

## A resource that stores a user's preferences on their intalled mods

## If [code]true[/code], any mod can be enabled and effect the game. Otherwise, all mod effect will be
## blocked from being enabled and granted.
@export var are_mods_enabled: bool = true:
	set(value):
		if are_mods_enabled != value:
			are_mods_enabled = value
			emit_changed()


## If [code]true[/code], cheat mods can be enabled and effect the game. Only applicable when
## [member are_mods_enabled] is also [code]true[/code]. Otherwise, all cheat mods will be blocked
## from being enabled and granted. See [member Mod.is_cheat] for more information on cheat mods.
@export var are_cheats_enabled: bool = true:
	set(value):
		if are_cheats_enabled != value:
			are_cheats_enabled = value
			emit_changed()


## An [Array][[String]] of the currently enabled mods. The [String]s come from [method Mod.get_identifier].
@export var enabled_mods: Array[String] = []


## If [code]true[/code], mods will be allowed to print to the console with contextual information.
## Useful for debugging.
@export var enable_logging: bool = true:
	set(value):
		if enable_logging != value:
			enable_logging = value
			emit_changed()

## The path that this resource will be saved (see [member ProjectSettings."mod_system/mod_settings_save_path"]) 
static var save_path: String:
	get: return ModSystemProjectSettings.get_mod_settings_save_path()


func _init() -> void:
	changed.connect(save)


## Returns [code]true[/code] if the given mod is enabled (see [member enabled_mods])
func is_enabled(mod: Mod) -> bool:
	return mod.get_identifier() in enabled_mods


## Returns [code]true[/code] if a given mod can be enabled
func can_enable(mod: Mod) -> bool:
	return (
		are_mods_enabled
		and not mod.get_identifier() in enabled_mods
		and (are_cheats_enabled if mod.is_cheat else true)
	)


## Returns [code]true[/code] if a given mod can be disabled
func can_disable(mod: Mod) -> bool:
	return mod.get_identifier() in enabled_mods


## Enabled the given mod and saves the settings
func enable_mod(mod: Mod) -> void:
	var id: String = mod.get_identifier()
	if mod is Mod and not id in enabled_mods:
		enabled_mods.append(id)
		emit_changed()


## Disables the given mod and saves the settings
func disable_mod(mod: Mod) -> void:
	var id: String = mod.get_identifier()
	if mod is Mod and id in enabled_mods:
		enabled_mods.erase(id)
		emit_changed()


## Saves this resource (see [member save_path])
func save() -> void:
	ResourceSaver.save(self, save_path)
	ModSystemLogger.logs("Settings saved")


## Loads the resource, if it exists. Otherwise, creates a new settings file (see [member save_path])
static func load_settings() -> ModSettings:
	if ResourceLoader.exists(save_path):
		return ResourceLoader.load(save_path)
	return ModSettings.new()
