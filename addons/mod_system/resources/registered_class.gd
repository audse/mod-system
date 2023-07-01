class_name RegisteredClass extends Object

## Defines a [Script] associated with a unique class name
##
## A [RegisteredClass] defines a [Script] class with a given name. If the name can be either
## the [member Script.resource_path] or provided explicitly.


## The unique given name for this class – either [member Script.resource_path] or explicitly provided.
var name: StringName
## The class that is registered.
var cls: Script
## The [RegisteredClass] that [member cls] [code]extends[/code].
var parent: RegisteredClass = null


## Constructs a new [RegisteredClass] with the given [member name], [member cls], and [member parent]
func _init(name_value: StringName, cls_value: Script, parent_value: RegisteredClass = null) -> void:
	name = name_value
	cls = cls_value
	parent = parent_value


## Constructs a new [RegisteredClass] by parsing the [member name] from the [GDScript]'s 
## [code]class_name[/code] if it exists (otherwise the [member GDScript.resource_path]) and the
## parent by parsing the [code]extends[/code] class
static func from_script(script: GDScript) -> RegisteredClass:
	var cls_name := ModScriptParser.get_class_name(script)
	return RegisteredClass.new(
		script.resource_path if cls_name.is_empty() else cls_name,
		script,
		ModClassDB.get_by_name(ModScriptParser.get_extended_class(script))
	)


## Returns [code]true[/code] if the [member parent] (or the parent's [member parent], etc.)
## is the [code]ancestor[/code].
func has_ancestor(ancestor: RegisteredClass) -> bool:
	return (
		ancestor == parent
		or (parent.has_ancestor(ancestor) if parent else false)
	)
