class_name Mod extends Resource

## A resource defining the shared data for all instances of a mod
##
## This resource defines the metadata (e.g. name, thumbnail, etc) and all shared data (e.g. assets)
## for a mod. 
## [br][br]A mod may have multiple instances (such as a button that appears in multiple places)
## so this resource only handles [b]shared data[/b].
## [br][br]A mod may only be instanced once per game [Object].

## Emitted when this mod is registered in the ModSystem.
signal registered

## Emitted when this mod is unregistered from the ModSystem.
signal unregistered

## Emitted when this mod is enabled by the user. This does not mean that the mod is in effect.
## See [member ModSettings.enabled_mods].
signal enabled

## Emitted when this mod is disabled by the user. See [member ModSettings.enabled_mods].
signal disabled

## Emitted when this mod is granted to an [Object], creating a new [ModInstance].
signal granted(instance: ModInstance)

## Emitted when this mod is revoked from an [Object], destroying the [ModInstance].
signal revoked(instance: ModInstance)

## If [code]true[/code], the game should be restarted after enabling this mod in order for it to
## take effect. This may happen when the mod affects a core feature of the game that only gets
## loaded on start.
@export var requires_restart: bool = false

## If [code]true[/code], this mod enables the player to cheat. Having this as a separate flag allows
## the player to easily toggle whether or not they want to play with cheats.
@export var is_cheat: bool = false

## This is a list of [member RegisteredClass.name]s that this mod can be granted to.
@export var grantable_owners := PackedStringArray([])

## The script that will be instantiated when this mod is granted.
@export var instance_script: ModScript

## A list of [ModAsset]s that can be referenced throughout your mod. This allows you to load an
## asset once but use it multiple times.
@export var assets: Array[ModAsset] = []


@export_group("Metadata")
## The name of the mod. Will only be used in the mod settings interface.
@export var name: String
## The author of the mod. Will only be used in the mod settings interface.
@export var author: String
## The version of the mod. Will only be used in the mod settings interface.
@export var version: String = "1.0.0"
## The download/informational url of the mod. Will only be used in the mod settings interface.
@export var url: String
## The thumbnail for the mod. Will only be used in the mod settings interface.
@export var thumbnail: Texture2D

## A list of currently active instances ([Dictionary][[Object], [ModInstance]])
var instances: Dictionary = {}

## If [code]true[/code], the mod is currently enabled in the [ModSettings] and will take effect
## when applicable.
var is_enabled: bool:
	get: return ModSystem.settings.is_enabled(self) if ModSystem else false


func _init() -> void:
	registered.connect(_on_registered)
	unregistered.connect(_on_unregistered)
	enabled.connect(_on_enabled)
	disabled.connect(_on_disabled)


## Grants this mod to [code]owner[/code], creating a new [ModInstance].
func grant(owner: Object) -> void:
	if is_enabled: ModInstance.new(self, owner).grant()


## Revokes this mod from the given [code]owner[/code], destroying the [ModInstance].
func revoke(owner: Object) -> void:
	var instance: ModInstance = instances.get(owner)
	if instance: instance.revoke()


## Returns the [ModInstance] associated with the given [code]owner[/code], if it exists.
func get_instance(owner: Object) -> ModInstance:
	return instances.get(owner)


## Returns the [ModAsset] associated with the given [code]key[/code], if it exists.
func get_asset(key: String) -> ModAsset:
	for asset in assets:
		if asset.key == key: return asset
	return null


## Called when [signal registered] is emitted.
func _on_registered() -> void:
	ModSystemLogger.mod_log(self, "Registered")


## Called when [signal unregistered] is emitted.
func _on_unregistered() -> void:
	ModSystemLogger.mod_log(self, "Unregistered")


## Called when [signal enabled] is emitted.
func _on_enabled() -> void:
	ModSystemLogger.mod_log(self, "Enabled")


## Called when [signal disabled] is emitted.
func _on_disabled() -> void:
	ModSystemLogger.mod_log(self, "Disabled")


## Returns a [String] that idenitifies this mod, usually the file path
func get_identifier() -> String:
	return resource_path
