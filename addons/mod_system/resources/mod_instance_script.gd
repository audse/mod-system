class_name ModInstanceScript extends Resource

## The main script for handling the effects of your mods
##
## This is the class that should be extended when writing your mods. This is the script that will
## be called in-game and be able to effect gameplay. See [member Mod.instance_script].


const ButtonBase := preload("mod_instance_script/base_button.gd")
const ControlBase := preload("mod_instance_script/control.gd")
const NodeBase := preload("mod_instance_script/node.gd")
const ObjectBase := preload("mod_instance_script/object.gd")
const ResourceBase := preload("mod_instance_script/resource.gd")


## The [ModInstance] of which this script belongs
var instance: ModInstance = null


func _init(instance_value: ModInstance) -> void:
	instance = instance_value
	
	instance.mod.granted.connect(func(_instance): _on_granted())
	instance.mod.revoked.connect(func(_instance): _on_revoked())


func _connect_signals(signals: Dictionary) -> void:
	for signal_name in signals:
		if instance.owner.has_signal(signal_name): 
			instance.owner.connect(signal_name, signals[signal_name])


## If logging is enabled (see [member ModSettings.enable_logging]), prints the [code]message[/code]
## to the terminal with contextual information about the current [Mod].
## (in [member instance], see [member ModInstance.mod])
func logs(message: String) -> void:
	ModSystemLogger.mod_log(instance.mod, message)


## Virtual method. Called when the mod is granted to the owner.
## [br]•  The granted mod is [member ModInstance.mod] in [member instance]
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_granted() -> void:
	pass


## Virtual method. Called when the mod is revoked from the owner.
## [br]•  The revoked mod is [member ModInstance.mod] in [member instance]
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_revoked() -> void:
	pass
