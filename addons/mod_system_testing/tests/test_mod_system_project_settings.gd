extends Node

func _init() -> void:
	var tests := (
		test_get_mod_dirs()
		+ test_get_mod_settings_save_path()
	)
	for test in tests:
		print_rich(test.run().report())


func test_get_mod_dirs() -> Array[Test]:
	return [
		(Test.new("test `mod_system/mod_dirs` is `['user://mods', 'res://tmp']`")
			.expect(func() -> PackedStringArray:
				ModSystemProjectSettings.set_mod_dirs(PackedStringArray(["user://mods", "res://tmp"]))
				return ModSystemProjectSettings.get_mod_dirs())
			.to_be(PackedStringArray(["user://mods", "res://tmp"]))),
		(Test.new("test `mod_system/mod_dirs` does not include `['res://addons']`")
			.expect(func() -> PackedStringArray:
				ModSystemProjectSettings.set_mod_dirs(PackedStringArray(["user://mods", "res://tmp"]))
				return ModSystemProjectSettings.get_mod_dirs())
			.and_check(func(value: PackedStringArray) -> bool: return not ("res://addons" in value))),
	]


func test_get_mod_settings_save_path() -> Array[Test]:
	return [
		(Test.new("test `mod_system/mod_settings/save_path` is `user://mod_settings.tres`")
			.expect(func() -> String:
				ModSystemProjectSettings.set_mod_settings_save_path("user://mod_settings.tres")
				return ModSystemProjectSettings.get_mod_settings_save_path())
			.to_be("user://mod_settings.tres"))
	]
