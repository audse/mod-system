class_name ModInstance extends Object

## [ModInstance]s are created when a [Mod] is granted to an [Object].
##
## [Mod]s can only be granted when they are enabled.
## [br]See [member ModSystem.settings.enabled_mods] for more information on enabling mods
## [br]See [method grant] for more information on granting mods

## The [Mod] that has been granted
var mod: Mod

## The [Object] to which the [member mod] has been granted
var owner: Object

## The [ModInstanceScript] that should be run upon granting
var instance_script: ModInstanceScript


func _init(mod_value: Mod, owner_value: Object) -> void:
	mod = mod_value
	owner = owner_value
	
	# Add instance script
	if mod.instance_script and mod.instance_script.inner_script:
		instance_script = mod.instance_script.inner_script.new(self)


## Grants the [member mod] to the [member owner], if it's enabled (see [member Mod.is_enabled]
func grant() -> void:
	if mod.is_enabled:
		mod.instances[owner] = self
		mod.granted.emit(self)
		ModSystem.mod_granted.emit(self)
	else: revoke()

## Revokes the [member mod] from the [member owner]
func revoke() -> void:
	if mod.is_enabled: 
		mod.instances.erase(owner)
		mod.revoked.emit(self)
		ModSystem.mod_revoked.emit(self)
	free()
