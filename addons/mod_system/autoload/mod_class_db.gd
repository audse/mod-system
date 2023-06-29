extends Node

## The ModClassDB is an information repository about classes that are used in the mod system


signal class_registered(cls: RegisteredClass)
signal class_unregistered(cls: RegisteredClass)

var registered_classes: Array[RegisteredClass] = []
var registered_class_names = PackedStringArray([])
var registered_scripts = []


func _init() -> void:
	class_registered.connect(func(_cls): _update_cached_data())
	class_unregistered.connect(func(_cls): _update_cached_data())
	_update_cached_data()

	# Register classes from this plugin
	for cls_name in ModSystemUtils.Scripts.keys():
		register(cls_name, ModSystemUtils.Scripts[cls_name])


func register(cls_name: StringName, cls: Script, parent: RegisteredClass = null) -> RegisteredClass:
	if not is_class_name_registered(cls_name):
		var registered_class := RegisteredClass.new(cls_name, cls, parent)
		registered_classes.append(registered_class)
		class_registered.emit(registered_class)
		return registered_class
	return get_by_name(cls_name)


func unregister(cls: StringName) -> void:
	if cls in registered_classes:
		var registered_class := get_by_name(cls)
		if registered_class:
			registered_classes.erase(registered_class)
			class_unregistered.emit(registered_class)


func register_object(cls: Object, parent: RegisteredClass = null) -> RegisteredClass:
	var cls_script: Script = cls.get_script()
	if not cls_script.resource_path.is_empty():
		return register(cls_script.resource_path, cls_script, parent)
	return null


func register_script(script: GDScript, cls_name: StringName = &"") -> RegisteredClass:
	return register(
		script.resource_path if cls_name.is_empty() else cls_name,
		script,
		ModClassDB.get_by_name(ScriptUtils.get_extended_class(script))
	)

func is_class_name_registered(cls: StringName) -> bool:
	return cls in registered_class_names


func is_script_registered(cls: Script) -> bool:
	return cls in registered_scripts


func get_by_name(cls: StringName) -> RegisteredClass:
	for registered_class in registered_classes:
		if registered_class.name == cls: return registered_class
	return null


func get_by_script(cls: Script) -> RegisteredClass:
	for registered_class in registered_classes:
		if registered_class.cls == cls: return registered_class
	return null


func _update_cached_data() -> void:
	# Update registered_class_names
	registered_class_names = PackedStringArray([])
	for cls in registered_classes:
		registered_class_names.append(cls.name)
	registered_class_names.sort()
	
	# Update registered scripts
	registered_scripts = []
	for cls in registered_classes:
		registered_scripts.append(cls.cls)
