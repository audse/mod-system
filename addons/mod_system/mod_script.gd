class_name ModScript extends Resource

## A container for a script to be used as [member Mod.instance_script]
##
## This class is a container for a [GDScript] file. When created, it will register the 
## [member inner_script] class to [ModClassDB] and save the new [RegisteredClass] in 
## [member registered_class].


## The [GDScript] that this [ModScript] is referring to.
@export var inner_script: GDScript = null

## The associated [RegisteredClass] for [member inner_script].
var registered_class: RegisteredClass


func _init() -> void:
	if inner_script: setup(inner_script)


## Sets [member inner_script] to [code]script_value[/code] and registers [code]script_value[/code]
## to [ModClassDB].
func setup(script_value: GDScript) -> ModScript:
	inner_script = script_value
	if script_value:
		registered_class = ModClassDB.register_script(script_value)
		return self
	return null


## Creates a new [ModScript] from the file at the given [code]path[/code], and registers it with
## [ModClassDB].
static func load_script(path: String) -> ModScript:
	return ModScript.new().setup(load(path))
