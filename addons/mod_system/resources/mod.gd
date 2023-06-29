class_name Mod extends Resource

signal registered
signal unregistered
signal enabled
signal disabled
signal granted(instance: ModInstance)
signal revoked(instance: ModInstance)

@export var requires_restart: bool = false
@export var is_cheat: bool = false
## This mod can only be granted to owning [Object]s that have [Script]s in this list
@export var grantable_owners := PackedStringArray([])
@export var instance_script: ModScript
@export var assets: Array[ModAsset] = []

@export_group("Metadata")
@export var name: String
@export var author: String
@export var version: String = "1.0.0"
@export var url: String
@export var thumbnail: Texture2D



## [Dictionary][[Object], [ModInstance]]
var instances: Dictionary = {}

var is_enabled: bool:
	get: return ModSystem.settings.is_enabled(self) if ModSystem else false


func _init() -> void:
	registered.connect(_on_registered)
	unregistered.connect(_on_unregistered)
	enabled.connect(_on_enabled)
	disabled.connect(_on_disabled)


func register() -> void:
	ModSystem.register(self)


func unregister() -> void:
	ModSystem.unregister(self)


func enable() -> void:
	ModSystem.enable(self)


func disable() -> void:
	ModSystem.disable(self)


func grant(owner: Object) -> void:
	if is_enabled: ModInstance.new(self, owner).grant()


func revoke(owner: Object) -> void:
	var instance: ModInstance = instances.get(owner)
	if instance: instance.revoke()


func get_instance(owner: Object) -> ModInstance:
	return instances.get(owner)


func get_asset(key: String) -> ModAsset:
	for asset in assets:
		if asset.key == key: return asset
	return null


func _on_registered() -> void:
	ModSystemUtils.mod_log(self, "Registered")


func _on_unregistered() -> void:
	ModSystemUtils.mod_log(self, "Unregistered")


func _on_enabled() -> void:
	ModSystemUtils.mod_log(self, "Enabled")


func _on_disabled() -> void:
	ModSystemUtils.mod_log(self, "Disabled")


static func from_json(json: Dictionary) -> Mod:
	var mod := Mod.new()
	
	# Gameplay
	mod.requires_restart = json.get("requires_restart", false)
	mod.is_cheat = json.get("is_cheat", false)
	mod.grantable_owners = PackedStringArray(json.get("grantable_owners", []))
	
	# Metadata
	var meta: Dictionary = json.get("meta", {})
	mod.name = meta.get("name", "")
	mod.author = meta.get("author", "")
	mod.version = meta.get("version", "")
	mod.url = meta.get("url", "")
	
	return mod


func get_identifier() -> String:
	return resource_path
