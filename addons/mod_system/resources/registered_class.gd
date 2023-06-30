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


## Returns [code]true[/code] if the [member parent] (or the parent's [member parent], etc.)
## is the [code]ancestor[/code].
func has_ancestor(ancestor: RegisteredClass) -> bool:
	return (
		ancestor == parent
		or (parent.has_ancestor(ancestor) if parent else false)
	)
