extends Node

var Paths = {
	ModA = to_absolute("mock_data/mod_a.mod.json"),
	ModZ = to_absolute("mock_data/mod_z.mod.json"),
}


func _init() -> void:
	var tests := (
		test_load_json()
		+ test_load_json_mod()
	)
	for test in tests:
		print_rich(test.run().report())


func to_absolute(path: String) -> String:
	return ("res://addons/mod_system_testing/tests/" + path).simplify_path()


func test_load_json() -> Array[Test]:
	return [
		(Test.new("test `mod_a.mod.json` is `{ 'meta': { 'name': 'Test Mod A' } }`")
			.expect(ModSystemResourceLoader.load_json.bind(Paths.ModA))
			.to_be({ meta = { name = 'Test Mod A' } })),
		(Test.new("test `mod_z.mod.json` is empty/non-existent (`{}`)")
			.expect(ModSystemResourceLoader.load_json.bind(Paths.ModZ))
			.to_be({})),
	]


func test_load_json_mod() -> Array[Test]:
	return [
		(Test.new("test `mod_a.mod.json` has name `Test Mod A`")
			.expect(ModSystemResourceLoader.load_json_mod.bind(Paths.ModA))
			.and_check(func(resource) -> bool: return (resource as Mod).name == "Test Mod A")),
		(Test.new("`mod_z.mod.json` does not exist")
			.expect(ModSystemResourceLoader.load_json_mod.bind(Paths.ModZ))
			.to_be(null)),
	]
