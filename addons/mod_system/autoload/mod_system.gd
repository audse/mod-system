extends Node

signal mod_registered(mod: Mod)
signal mod_unregistered(mod: Mod)

signal mod_enabled(mod: Mod)
signal mod_disabled(mod: Mod)

signal mod_granted(instance: ModInstance)
signal mod_revoked(instance: ModInstance)

var registered_mods: Array[Mod] = []

var settings: ModSettings = ModSettings.load()


func initialize(mod_owner: Object, mod_owner_name = null) -> void:
	if mod_owner_name is StringName: ModClassDB.register(mod_owner_name, mod_owner.get_script())
	else: ModClassDB.register_object(mod_owner)
	grant_all(mod_owner)


func register(mod: Mod) -> void:
	if not mod in registered_mods:
		registered_mods.append(mod)
		mod_registered.emit(mod)
		mod.registered.emit()


func unregister(mod: Mod) -> void:
	if mod in registered_mods:
		registered_mods.erase(mod)
		mod_unregistered.emit(mod)
		mod.unregistered.emit()


func enable(mod: Mod) -> void:
	if mod in registered_mods and settings.can_enable(mod):
		settings.enable_mod(mod)
		mod_enabled.emit(mod)
		mod.enabled.emit()


func disable(mod: Mod) -> void:
	if mod in registered_mods and settings.can_disable(mod):
		settings.disable_mod(mod)
		mod_disabled.emit(mod)
		mod.disabled.emit()


func enable_all() -> void:
	registered_mods.map(enable)


func disable_all() -> void:
	registered_mods.map(disable)


func grant(mod: Mod, mod_owner: Object) -> void:
	if mod.is_enabled:
		mod.grant(mod_owner)


func grant_all(mod_owner: Object) -> void:
	for mod in get_grantable_mods(mod_owner):
		grant(mod, mod_owner)


func revoke(mod: Mod, mod_owner: Object) -> void:
	mod.revoke(mod_owner)


func revoke_all(mod_owner: Object) -> void:
	for mod in get_grantable_mods(mod_owner):
		revoke(mod, mod_owner)


func get_grantable_mods(mod_owner: Object) -> Array:
	var grantable_mods: Array[Mod] = []
	var owner_cls := ModClassDB.get_by_script(mod_owner.get_script())
	if owner_cls:
		for mod_id in settings.enabled_mods:
			var mod := get_mod_by_id(mod_id)
			if mod and owner_cls.name in mod.grantable_owners: grantable_mods.append(mod)
	return grantable_mods


func get_mod_by_id(id: String) -> Mod:
	for mod in registered_mods:
		if mod.get_identifier() == id: return mod
	return null
