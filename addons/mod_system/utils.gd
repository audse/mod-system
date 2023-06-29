class_name ModSystemUtils extends Object

const Settings := {
	ModPath = {
		Path = "mod_system/mod_paths",
		Default = "user://mods",
		Info = {
			name = "mod_system/mod_paths",
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

const Scripts := {
	&"Mod": preload("resources/mod.gd"),
	&"ModInstanceScript": preload("resources/mod_instance_script.gd"),
	&"ModAsset": preload("resources/mod_asset.gd"),
	&"ModInstance": preload("resources/mod_instance.gd"),
	&"RegisteredClass": preload("resources/registered_class.gd"),
	&"ModClassDB": preload("autoload/mod_class_db.gd"),
	&"ModLoader": preload("autoload/mod_loader.gd"),
	&"ModSystem": preload("autoload/mod_system.gd"),
	&"ModSettings": preload("resources/mod_settings.gd"),
}


static func mod_log(mod: Mod, message: String) -> void:
	if ModSystem and ModSystem.settings.enable_logging: print_rich(
		"[color=gray][ModSystem:{mod}][/color] [color=white]{message}[/color]".format({ 
			mod = mod.name,
			message = message 
		})
	)


static func log(message: String) -> void:
	if ModSystem and ModSystem.settings.enable_logging: print_rich(
		"[color=gray][ModSystem][/color] [color=white]{message}[/color]".format({ 
			message = message 
		})
	)


static func get_setting(setting: Dictionary):
	if ProjectSettings.has_setting(setting.Path):
		return ProjectSettings.get_setting(setting.Path)
	return setting.Default


static func get_imported_path(path: String) -> String:
	return path.replace(path.get_extension(), "import.tres").simplify_path()
