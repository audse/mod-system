class_name RegisteredClass extends Object

var name: StringName
var cls: Script
var parent: RegisteredClass


func _init(name_value: StringName, cls_value: Script, parent_value: RegisteredClass = null) -> void:
	name = name_value
	cls = cls_value
	parent = parent_value


func instantiate() -> Object:
	return cls.new()


func has_ancestor(ancestor: RegisteredClass) -> bool:
	return (
		ancestor == parent
		or (parent.has_ancestor(ancestor) if parent else false)
	)
