extends Node


func _init() -> void:
	var tests := (
		test_register()
		+ test_get_by_name()
		+ test_get_by_script()
	)
	for test in tests:
		print_rich(test.run().report())


func test_register() -> Array[Test]:
	return [
		(Test.new("current script's registered name is `res://addons/mod_system_testing/tests/test_mod_class_db.gd`")
			.expect(func() -> StringName:
				var cls := ModClassDB.register(get_script())
				return cls.name)
			.to_be(&"res://addons/mod_system_testing/tests/test_mod_class_db.gd")),
	]


func test_get_by_name() -> Array[Test]:
	return [		
		(Test.new("current script's registered name is not `Test_ModClassDB`")
			.expect(func() -> StringName:
				var cls := ModClassDB.get_by_name(get_script().resource_path)
				return cls.name)
			.to_not_be(&"`Test_ModClassDB")),
	]


func test_get_by_script() -> Array[Test]:
	return [
		(Test.new("current script is registered")
			.expect(func() -> bool: return ModClassDB.get_by_script(get_script()) != null)
			.to_be(true))
	]
