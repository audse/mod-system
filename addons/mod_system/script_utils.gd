class_name ScriptUtils extends Object



static func get_extended_class(script: GDScript) -> StringName:
	if script:
		var regex := RegEx.create_from_string("extends[\\s\\t\\n]*([^\\s\\t\\n]+)")
		var result := regex.search(script.source_code)
		return StringName(result.get_string(1))
	return &""


static func get_class_name(script: GDScript) -> StringName:
	if script:
		var regex := RegEx.create_from_string("\\bclass_name\\b[\\s\\t\\n]*([^\\s\\t\\n]+)")
		var result := regex.search(script.source_code)
		if result and result.strings.size() > 1:
			return StringName(result.get_string(1))
	return &""
