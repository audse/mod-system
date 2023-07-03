class_name ModInstanceScript_Resource extends ModInstanceScript.ObjectBase


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Resource: _connect_signals({
		changed = _on_owner_changed,
		setup_local_to_scene_requested = _on_owner_setup_local_to_scene_requested
	})


## Virtual method. Called when the [signal Resource.changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Resource].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_changed() -> void:
	pass


## Virtual method. Called when the [signal Resource.setup_local_to_scene_requested] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Resource].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_setup_local_to_scene_requested() -> void:
	pass
