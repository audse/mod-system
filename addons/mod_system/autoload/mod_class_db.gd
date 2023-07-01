extends Node

## The ModClassDB is an information repository about classes that are used in the mod system
##
## ModClassDB stores information about classes. All classes that you want to be moddable should 
## register themselves in the ModClassDB.
## [br][br]
## The easiest way to do so is by calling [method ModSystem.initialize]. Calling that function 
## allows a script to (a) register itself to ModClassDB, and (b) grant all enabled mods that 
## are grantable to the calling script.

## Emitted when a class is registered to ModClassDB
signal class_registered(cls: RegisteredClass)

## Emitted when a class is unregistered from ModClassDB
signal class_unregistered(cls: RegisteredClass)

## All classes currently registered in ModClassDB
var registered_classes: Array[RegisteredClass] = []


const _Scripts := {
	&"Mod": preload("../resources/mod.gd"),
	&"ModInstanceScript": preload("../resources/mod_instance_script.gd"),
	&"ModAsset": preload("../resources/mod_asset.gd"),
	&"ModInstance": preload("../resources/mod_instance.gd"),
	&"RegisteredClass": preload("../resources/registered_class.gd"),
	&"ModSettings": preload("../resources/mod_settings.gd"),
	&"ModLoader": preload("mod_loader.gd"),
	&"ModSystem": preload("mod_system.gd"),
}


func _enter_tree() -> void:
	# Register classes from this plugin
	for script in ModClassDB._Scripts.values():
		register(script)


## Registered a class and returns a generated [RegisteredClass] object.
func register(script: GDScript) -> RegisteredClass:
	if not is_script_registered(script):
		var registered_class = RegisteredClass.from_script(script)
		registered_classes.append(registered_class)
		class_registered.emit(registered_class)
		return registered_class
	return get_by_script(script)


## Unregisters a class.
func unregister(cls: StringName) -> void:
	if cls in registered_classes:
		var registered_class := get_by_name(cls)
		if registered_class:
			registered_classes.erase(registered_class)
			class_unregistered.emit(registered_class)


## Returns [code]true[/code] if the provided class name is registered.
func is_class_name_registered(cls: StringName) -> bool:
	for registered_cls in registered_classes:
		if registered_cls.name == cls: return true
	return false


## Returns [code]true[/code] if the provided [Script] is registered.
func is_script_registered(cls: Script) -> bool:
	for registered_cls in registered_classes:
		if registered_cls.cls == cls: return true
	return false


## Returns a [RegisteredClass] if the provided class name is registered. Otherwise, returns
## [code]null[/code].
func get_by_name(cls: StringName) -> RegisteredClass:
	if cls.is_empty(): return null
	for registered_class in registered_classes:
		if registered_class.name == cls: return registered_class
	return null


## Returns a [RegisteredClass] if the provided [Script] is registered. Otherwise, returns
## [code]null[/code].
func get_by_script(cls: Script) -> RegisteredClass:
	for registered_class in registered_classes:
		if registered_class.cls == cls: return registered_class
	return null
