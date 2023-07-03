class_name ModInstanceScript_Object extends ModInstanceScript


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Object: _connect_signals({
		property_list_changed = _on_owner_property_list_changed,
		script_changed = _on_owner_script_changed
	})


## Virtual method. Called when the [signal Object.property_list_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Object].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_property_list_changed() -> void:
	pass


## Virtual method. Called when the [signal Object.script_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Object].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_script_changed() -> void:
	pass
