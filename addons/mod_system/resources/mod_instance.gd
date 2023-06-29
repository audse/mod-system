class_name ModInstance extends Object

## [ModInstance]s are created when a [Mod] is granted to an [Object].
##
## [Mod]s can only be granted when they are enabled.
## [br] See [member ModSystem.enabled_mods] for more information on enabling mods
## [br] See [method grant] for more information on granting mods

var mod: Mod
var owner: Object
var instance_script: ModInstanceScript


func _init(mod_value: Mod, owner_value: Object) -> void:
	mod = mod_value
	owner = owner_value
	
	# Add instance script
	if mod.instance_script and mod.instance_script.inner_script:
		instance_script = mod.instance_script.inner_script.new(self)


func grant() -> void:
	if mod.is_enabled:
		mod.instances[owner] = self
		mod.granted.emit(self)
		ModSystem.mod_granted.emit(self)
	else: revoke()


func revoke() -> void:
	if mod.is_enabled: 
		mod.instances.erase(owner)
		mod.revoked.emit(self)
		ModSystem.mod_revoked.emit(self)
	free()
