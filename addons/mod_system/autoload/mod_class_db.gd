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


func _init() -> void:
	# Register classes from this plugin
	for cls_name in ModSystemUtils.Scripts.keys():
		register(cls_name, ModSystemUtils.Scripts[cls_name])


## Registers a named class and returns a generated [RegisteredClass] object.
func register(cls_name: StringName, cls: Script) -> RegisteredClass:
	if not is_class_name_registered(cls_name):
		var parent_name := ScriptUtils.get_extended_class(cls)
		var registered_class := RegisteredClass.new(cls_name, cls, get_by_name(parent_name))
		registered_classes.append(registered_class)
		class_registered.emit(registered_class)
		return registered_class
	return get_by_name(cls_name)


## Unregisters a class.
func unregister(cls: StringName) -> void:
	if cls in registered_classes:
		var registered_class := get_by_name(cls)
		if registered_class:
			registered_classes.erase(registered_class)
			class_unregistered.emit(registered_class)


## Registers an unnamed class at the classes' script path and returns a generated [RegisteredClass]
## object.
func register_object(cls: Object) -> RegisteredClass:
	var cls_script: Script = cls.get_script()
	if not cls_script.resource_path.is_empty():
		return register(cls_script.resource_path, cls_script)
	return null


## Registered a class (with an optional name) and returns a generated [RegisteredClass] object.
func register_script(script: GDScript, cls_name: StringName = &"") -> RegisteredClass:
	return register(
		script.resource_path if cls_name.is_empty() else cls_name,
		script,
	)


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
