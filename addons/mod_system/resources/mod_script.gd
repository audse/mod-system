class_name ModScript extends GDScript

## A container for a script to be used as [member Mod.instance_script]
##
## This class is a container for a [GDScript] file. When created, it will register the 
## class to [ModClassDB] and save the new [RegisteredClass] in [member registered_class].


## The associated [RegisteredClass].
var registered_class: RegisteredClass


func _init(script: GDScript) -> void:
	source_code = script.source_code
	take_over_path(script.resource_path)
	registered_class = ModClassDB.register(self)
	reload()


## Creates a new [ModScript] from the file at the given [code]path[/code], and registers it with
## [ModClassDB].
static func load_script(path: String) -> ModScript:
	if ResourceLoader.exists(path, "GDScript"):
		var resource: Resource = ResourceLoader.load(path, "GDScript")
		if resource != null and resource is GDScript:
			return ModScript.new(resource)
	return null
