extends Node

var mod_a := preload("mock_data/mod_a.tres")
var mod_b := preload("mock_data/mod_b.tres")


func _init() -> void:
	ModSystem.settings.enable_logging = false
	
	var tests := (
		test_register_mod()
		+ test_enable_mod()
		+ test_grant_mod()
		+ test_get_grantable_mods()
		+ test_revoke_mod()
		+ test_disable_mod()
		+ test_unregister_mod()
	)
	for test in tests:
		print_rich(test.run().report())
	
	ModSystem.settings.enable_logging = true


func test_register_mod() -> Array[Test]:
	return [
		(Test.new("is mod registered after registration")
			.expect(func() -> bool:
				ModSystem.register(mod_a)
				return ModSystem.get_mod_by_id(mod_a.get_identifier()) != null)
			.to_be(true))
	]


func test_enable_mod() -> Array[Test]:
	return [
		(Test.new("is mod enabled after enabling")
			.expect(func() -> bool:
				ModSystem.enable(mod_a)
				return mod_a.is_enabled)
			.to_be(true)),
		(Test.new("is mod disabled after disabling")
			.expect(func() -> bool:
				ModSystem.disable(mod_a)
				return mod_a.is_enabled)
			.to_be(false)),
	]


func test_get_grantable_mods() -> Array[Test]:
	return [
		(Test.new("can grant mod to self")
			.expect(func() -> Array:
				mod_a.grantable_owners.append(get_script().resource_path)
				return ModSystem.get_grantable_mods(self))
			.to_be([mod_a])),
	]


func test_grant_mod() -> Array[Test]:
	return [
		(Test.new("is mod granted after granting")
			.expect(func() -> bool:
				mod_a.grantable_owners.append(get_script().resource_path)
				ModSystem.enable(mod_a)
				ModSystem.initialize(self)
				return mod_a.get_instance(self) != null)
			.to_be(true)),
	]


func test_revoke_mod() -> Array[Test]:
	return [
		(Test.new("is mod granted after revoking")
			.expect(func() -> bool:
				ModSystem.revoke(mod_a, self)
				return mod_a.get_instance(self) != null)
			.to_be(false)),
	]


func test_disable_mod() -> Array[Test]:
	return [
		(Test.new("is mod disabled after disabling")
			.expect(func() -> bool:
				ModSystem.disable(mod_a)
				return mod_a.is_enabled)
			.to_be(false)),
	]


func test_unregister_mod() -> Array[Test]:
	return [
		(Test.new("is mod unregistered after unregistration")
			.expect(func() -> bool:
				ModSystem.unregister(mod_a)
				return ModSystem.get_mod_by_id(mod_a.get_identifier()) == null)
			.to_be(true))
	]
