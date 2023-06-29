class_name ModScript extends Resource

@export var inner_script: GDScript = null

var registered_class: RegisteredClass


func _init() -> void:
	if inner_script: setup(inner_script)


func setup(script_value: GDScript) -> ModScript:
	inner_script = script_value
	if script_value:
		registered_class = ModClassDB.register_script(script_value)
		return self
	return null


static func load_script(path: String) -> ModScript:
	return ModScript.new().setup(load(path))
