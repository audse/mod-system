extends Node

## A singleton that handles all global functions needed for the mod system
##
## This class is the main point of entry for working with the mod system. You can install,
## enable, and grant mods all from this singleton.

## Emitted after a [Mod] is installed. See [method install].
signal mod_installed(mod: Mod)

## Emitted after a [Mod] is uninstalled. See [method uninstall].
signal mod_uninstalled(mod: Mod)

## Emitted after a [Mod] is enabled. See [method enable].
signal mod_enabled(mod: Mod)

## Emitted after a [Mod] is disabled. See [method disable].
signal mod_disabled(mod: Mod)

## Emitted after a [Mod] is granted to an [Object], creating a [ModInstance]. See [method grant].
signal mod_granted(instance: ModInstance)

## Emitted after a [Mod] is revoked from an [Object], destroying a [ModInstance]. See [method revoke].
signal mod_revoked(instance: ModInstance)

## An [Array][[Mod]] of currently installed mods.
var installed_mods: Array[Mod] = []

## The [ModSettings] object for the current user (see [method ModSettings.load_settings]).
var settings: ModSettings = ModSettings.load_settings()

func _after_finished_loading():
	if not ModLoader.is_finished_loading:
		await ModLoader.finished_loading


## This is a helper function that does two things:
## [br]1. Registers [code]mod_owner[/code] to [ModClassDB]. This must be done in order to grant mods.
## [br]2. Grants all possible mods to [code]mod_owner[/code].
## [br]This is the easiest way to start accepting mods in an [Object]. Add this inside 
## the [code]_init[/code] function to any class that you want to be able to grant mods to.
func initialize(mod_owner: Object) -> void:
	ModClassDB.register(mod_owner.get_script())
	await _after_finished_loading()
	grant_all(mod_owner)


## Installs the given [Mod] to [member installed_mods].
func install(mod: Mod) -> void:
	if not mod in installed_mods:
		installed_mods.append(mod)
		mod_installed.emit(mod)
		mod.installed.emit()


## Uninstall the given [Mod] from [member installed_mods].
func uninstall(mod: Mod) -> void:
	if mod in installed_mods:
		installed_mods.erase(mod)
		mod_uninstalled.emit(mod)
		mod.uninstalled.emit()


## If possible, enables the given [Mod]. See [method ModSettings.enable_mod].
func enable(mod: Mod) -> void:
	await _after_finished_loading()
	if mod in installed_mods and settings.can_enable(mod):
		settings.enable_mod(mod)
		mod_enabled.emit(mod)
		mod.enabled.emit()


## Enables all [member installed_mods]. See [method enable].
func enable_all() -> void:
	await _after_finished_loading()
	installed_mods.map(enable)


## If possible, disables the given [Mod]. See [method ModSettings.disable_mod].
func disable(mod: Mod) -> void:
	if mod in installed_mods and settings.can_disable(mod):
		settings.disable_mod(mod)
		mod_disabled.emit(mod)
		mod.disabled.emit()


## Disables all [member installed_mods]. See [method disable].
func disable_all() -> void:
	installed_mods.map(disable)


## Grants the [Mod] to the [code]mod_owner[/code] object, if possible. See [method Mod.grant].
func grant(mod: Mod, mod_owner: Object) -> void:
	if mod.is_enabled:
		mod.grant(mod_owner)


## Grants all possible [Mod]s to the [code]mod_owner[/code] object. See [method get_grantable_mods] 
## to see what mods are possible, and [method grant] for more information on granting mods.
func grant_all(mod_owner: Object) -> void:
	for mod in get_grantable_mods(mod_owner):
		grant(mod, mod_owner)


## Revokes the [Mod] from the [code]mod_owner[/code] object. See [method Mod.revoke].
func revoke(mod: Mod, mod_owner: Object) -> void:
	mod.revoke(mod_owner)


## Revokes all possible [Mod]s from the [code]mod_owner[/code] object. See [method get_grantable_mods] 
## to see what mods are possible, and [method revoke] for more information on revoking mods.
func revoke_all(mod_owner: Object) -> void:
	for mod in get_grantable_mods(mod_owner):
		revoke(mod, mod_owner)


## Returns an [Array][[Mod]] of all [Mod]s that are grantable to [code]mod_owner[/code]. 
## [br]Classes must be registered in [ModClassDB] to find any grantable mods.
## This list is created by:
## [br]1. Looking for the [RegisteredClass] of [code]mod_owner[/code]
## [br]2. Looking through all [member installed_mods] and returning all [Mod]s where 
## [member Mod.grantable_owners] contains the [member RegisteredClass.name] of [code]mod_owner[/code]
func get_grantable_mods(mod_owner: Object) -> Array:
	var grantable_mods: Array[Mod] = []
	var owner_cls := ModClassDB.get_by_script(mod_owner.get_script())
	if owner_cls:
		for mod_id in settings.enabled_mods:
			var mod := get_mod_by_id(mod_id)
			if mod and owner_cls.name in mod.grantable_owners: grantable_mods.append(mod)
	return grantable_mods


## Searches [member installed_mods] for the given ID. The ID comes from [method Mod.get_identifier].
func get_mod_by_id(id: String) -> Mod:
	for mod in installed_mods:
		if mod.get_identifier() == id: return mod
	return null
