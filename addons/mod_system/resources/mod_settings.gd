@tool
class_name ModSettings extends Resource

@export var are_mods_enabled: bool = true:
	set(value):
		if are_mods_enabled != value:
			are_mods_enabled = value
			emit_changed()
		
@export var are_cheats_enabled: bool = true:
	set(value):
		if are_cheats_enabled != value:
			are_cheats_enabled = value
			emit_changed()

@export var enabled_mods: Array[String] = []

@export var enable_logging: bool = true:
	set(value):
		if enable_logging != value:
			enable_logging = value
			emit_changed()


static var save_path: String:
	get: return ModSystemUtils.get_setting(ModSystemUtils.Settings.ModSettingsSavePath)


func _init() -> void:
	changed.connect(save)


func is_enabled(mod: Mod) -> bool:
	return (
		are_mods_enabled
		and mod.get_identifier() in enabled_mods
		and (are_cheats_enabled if mod.is_cheat else true)
	)


func can_enable(mod: Mod) -> bool:
	return (
		are_mods_enabled
		and not mod.get_identifier() in enabled_mods
		and (are_cheats_enabled if mod.is_cheat else true)
	)


func can_disable(mod: Mod) -> bool:
	return mod.get_identifier() in enabled_mods


func enable_mod(mod: Mod) -> void:
	var id: String = mod.get_identifier()
	if mod is Mod and not id in enabled_mods:
		enabled_mods.append(id)
		emit_changed()


func disable_mod(mod: Mod) -> void:
	var id: String = mod.get_identifier()
	if mod is Mod and id in enabled_mods:
		enabled_mods.erase(id)
		emit_changed()


func save() -> void:
	ResourceSaver.save(self, save_path)
	ModSystemUtils.log("Settings saved")


static func load() -> ModSettings:
	if ResourceLoader.exists(save_path):
		return ResourceLoader.load(save_path)
	return ModSettings.new()
