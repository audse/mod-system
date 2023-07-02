extends Node


func _init() -> void:
	var tests := (
		test_get_extension()
		+ test_is_mod_path()
		+ test_to_import_path()
	)
	for test in tests:
		print_rich(test.run().report())


func test_get_extension() -> Array[Test]:
	return [
		(Test.new("the extension of `a.mod.json` is `mod.json`")
			.expect(ModPath.get_extension.bind("a.mod.json"))
			.to_be("mod.json")),
		(Test.new("the extension of `a.json` is `json`")
			.expect(ModPath.get_extension.bind("a.json"))
			.to_be("json")),
		(Test.new("the extension of `directory.path/file.txt` is `txt`")
			.expect(ModPath.get_extension.bind("directory.path/file.txt"))
			.to_be("txt"))
	]


func test_is_mod_path() -> Array[Test]:
	return [
		(Test.new("`a.mod.json` is a mod path")
			.expect(ModPath.is_mod_path.bind("a.mod.json"))
			.to_be(true)),
		(Test.new("`a.mod.tres` is a mod path")
			.expect(ModPath.is_mod_path.bind("a.mod.tres"))
			.to_be(true)),
		(Test.new("`a.mod.res` is a mod path")
			.expect(ModPath.is_mod_path.bind("a.mod.res"))
			.to_be(true)),
		(Test.new("`a.mod.JSON` is a mod path")
			.expect(ModPath.is_mod_path.bind("a.mod.JSON"))
			.to_be(true)),
		(Test.new("`some/file.path/a.mod.json` is a mod path")
			.expect(ModPath.is_mod_path.bind("some/file.path/a.mod.json"))
			.to_be(true)),
		(Test.new("`a.json` is not a mod path")
			.expect(ModPath.is_mod_path.bind("a.json"))
			.to_be(false)),
		(Test.new("`a.tres` is not a mod path")
			.expect(ModPath.is_mod_path.bind("a.tres"))
			.to_be(false)),
		(Test.new("`a.res` is not a mod path")
			.expect(ModPath.is_mod_path.bind("a.res"))
			.to_be(false)),
		(Test.new("`a.mod.png` is not a mod path")
			.expect(ModPath.is_mod_path.bind("a.mod.png"))
			.to_be(false)),
	]


func test_to_import_path() -> Array[Test]:
	return [
		(Test.new("the import path of `a.png` is `a.import.tres")
			.expect(ModPath.to_import_path.bind("a.png"))
			.to_be("a.import.tres")),
		(Test.new("the import path of `a.mod.png` is `a.mod.import.tres")
			.expect(ModPath.to_import_path.bind("a.mod.png"))
			.to_be("a.mod.import.tres"))
	]
