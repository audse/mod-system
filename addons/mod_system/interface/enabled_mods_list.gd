extends "res://addons/mod_system/interface/mods_list.gd"


func _ready() -> void:
	mods = ModSystem.installed_mods
	render()


func render() -> void:
	if not is_inside_tree(): return
	
	# Render settings
	is_dimmed = {}
	for mod in ModSystem.installed_mods:
		is_dimmed[mod] = not (
			ModSystem.settings.are_mods_enabled
			and (ModSystem.settings.are_cheats_enabled if mod.is_cheat else true)
		)
	
	# Render mod list
	is_checked = {}
	for mod in ModSystem.installed_mods:
		is_checked[mod] = mod.is_enabled
	
	super.render()


func _on_toggled(checked: bool, mod: Mod) -> void:
	is_checked[mod] = checked
	if checked: ModSystem.enable(mod)
	else: ModSystem.disable(mod)
