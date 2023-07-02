extends Node

func _init() -> void:
	var tests := (
		test_get_extended_class_name()
		+ test_get_class_name()
	)
	for test in tests:
		print_rich(test.run().report())
	
	
func test_get_extended_class_name() -> Array[Test]:
	return [
		(Test.new("extended class of `test_script_parser.gd` is `Node`")
			.expect(ModScriptParser.get_extended_class.bind(get_script()))
			.to_be(&"Node")),
		(Test.new("extended class of `test_script_parser.gd` is not `Script`")
			.expect(ModScriptParser.get_extended_class.bind(get_script()))
			.to_not_be(&"Script")),
	]


func test_get_class_name() -> Array[Test]:
	var script_parser = load("res://addons/mod_system/utils/script_parser.gd")
	return [
		(Test.new("class_name of `ModScriptParser` is `ModScriptParser`")
			.expect(ModScriptParser.get_class_name.bind(script_parser))
			.to_be(&"ModScriptParser")),
		(Test.new("class_name of `ModScriptParser` is not `GDScriptParser`")
			.expect(ModScriptParser.get_class_name.bind(script_parser))
			.to_not_be(&"`GDScriptParser")),
	]
