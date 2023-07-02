class_name ModSystemProjectSettings extends Object

## Handles the [ProjectSettings] related to the mod system addon

## A dictionary containing the settings related to the mod system addon. Follows this format:
## [codeblock]
## {
##     [key: String]: {
##         "Path": String,
##         "Default": Variant,
##         "Info": {
##             "name": String, # same as Path
##             "type": Variant.Type,
##             "hint": @GlobalScope.PropertyHint, # optional
##             "hint_string": String, # optional
##         }
##     }
## }
## [/codeblock]
## See [method ProjectSettings.add_property_info] for more information about the [code]"Info"[/code]
## value.
const Settings := {
	ModDirs = {
		Path = "mod_system/mod_dirs",
		Default = "user://mods",
		Info = {
			name = "mod_system/mod_dirs",
			type = TYPE_STRING,
			hint = PROPERTY_HINT_PLACEHOLDER_TEXT,
			hint_string = "(e.g. user://mods, res://content)"
		}
	},
	ModSettingsSavePath = {
		Path = "mod_system/mod_settings_save_path",
		Default = "user://mod_settings.tres",
		Info = {
			name = "mod_system/mod_settings_save_path",
			type = TYPE_STRING,
			hint = PROPERTY_HINT_SAVE_FILE,
		}
	},
}

## Adds [code]mod_system/mod_dirs[/code] and [code]mod_system/mod_settings_save_path[/code] to
## [ProjectSettings], if they are not already there.
static func update_project_settings() -> void:
	for setting in ModSystemProjectSettings.Settings.values():
		if not ProjectSettings.has_setting(setting.Path):
			ProjectSettings.set_setting(setting.Path, setting.Default)
		ProjectSettings.add_property_info(setting.Info)


static func _get_setting(setting: Dictionary):
	if ProjectSettings.has_setting(setting.Path):
		return ProjectSettings.get_setting(setting.Path)
	return setting.Default


static func _set_setting(setting: Dictionary, value):
	if ProjectSettings.has_setting(setting.Path):
		ProjectSettings.set_setting(setting.Path, value)


## Returns an [Array][[String]] of all directories listed in [member ProjectSettings."mod_system/mod_dirs"].
static func get_mod_dirs() -> PackedStringArray:
	var mod_dirs := PackedStringArray([])
	var paths: String = ModSystemProjectSettings._get_setting(ModSystemProjectSettings.Settings.ModDirs)
	for path in paths.split(","):
		mod_dirs.append(path.strip_edges().simplify_path())
	return mod_dirs


## Sets  [member ProjectSettings."mod_system/mod_dirs"] to the provided value.
static func set_mod_dirs(dirs: PackedStringArray) -> void:
	ModSystemProjectSettings._set_setting(
		ModSystemProjectSettings.Settings.ModDirs, 
		", ".join(dirs)
	)


## Returns the [ModSettings] save path from [member ProjectSettings."mod_system/mod_settings_save_path"].
static func get_mod_settings_save_path() -> String:
	return ModSystemProjectSettings._get_setting(ModSystemProjectSettings.Settings.ModSettingsSavePath)


## Sets [member ProjectSettings."mod_system/mod_settings_save_path"] to the provided value.
static func set_mod_settings_save_path(save_path: String) -> void:
	ModSystemProjectSettings._set_setting(
		ModSystemProjectSettings.Settings.ModSettingsSavePath, 
		save_path
	)
