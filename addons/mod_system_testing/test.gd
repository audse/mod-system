class_name Test extends Object

class Result:
	var test: Test
	var is_ok: bool
	
	var failed_check: Callable
	
	var BackTickRegEx := RegEx.create_from_string("`([^`]*)`")
	
	func _init(args: Dictionary = {}) -> void:
		for key in args.keys(): if key in self: self[key] = args[key]
	
	
	func report() -> String:
		var description := "[color=gray][test:{caller}][/color] [color=white]{description}[/color]".format({
			caller = test.stack[1].function if test.stack.size() > 1 else "",
			description = BackTickRegEx.sub(test.description, "[code][color=pink]$1[/color][/code]", true)
		})
		return "{description}...{result}".format({
			description = description,
			result = "[color=green]ok[/color]" if is_ok else "[color=magenta]failed![/color]"
		})


var description: String = ""
var callable: Callable
var stack

var good_values: Array = []
var bad_values: Array = []
var found_value
var checks: Array[Callable] = []

func _init(description_value: String) -> void:
	description = description_value
	stack = get_stack()


func expect(callable_value: Callable) -> Test:
	callable = callable_value
	return self

func to_be(value) -> Test:
	good_values.append(value)
	return self


func to_be_one_of(values: Array) -> Test:
	good_values.append_array(values)
	return self


func to_not_be(value) -> Test:
	bad_values.append(value)
	return self


func to_not_be_any_of(values: Array) -> Test:
	bad_values.append_array(values)
	return self


func and_check(fn: Callable) -> Test:
	checks.append(fn)
	return self


func run(test_args: Array = []) -> Result:
	found_value = callable.callv(test_args)
	for check in checks + [
		is_good_value,
		is_not_bad_value,
	]: if not check.call(found_value): return Result.new({
		is_ok = false,
		failed_check = check,
		test = self
	})
	return Result.new({
		is_ok = true,
		test = self
	})


func is_good_value(value) -> bool:
	if good_values.size(): return value in good_values
	return true


func is_not_bad_value(value) -> bool:
	if bad_values.size(): return not (value in bad_values)
	return true
