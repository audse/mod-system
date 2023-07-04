class_name ModInstanceScript_Object extends ModInstanceScript


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Object: _connect_signals({
		property_list_changed = _on_owner_property_list_changed,
		script_changed = _on_owner_script_changed
	})
	if instance.owner is Tween: _connect_signals({
		finished = _on_owner_tween_finished,
		loop_finished = _on_owner_tween_loop_finished,
		step_finished = _on_owner_tween_step_finished,
	})
	if instance.owner is Tweener: _connect_signals({
		finished = _on_owner_tweener_finished
	})
	if instance.owner is TileData: _connect_signals({
		changed = _on_owner_tile_data_changed
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

# Tween methods


## Virtual method. Called when the [signal Tween.finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Tween].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tween_finished() -> void:
	pass


## Virtual method. Called when the [signal Tween.loop_finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Tween].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tween_loop_finished(_loop_count: int) -> void:
	pass


## Virtual method. Called when the [signal Tween.step_finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Tween].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tween_step_finished(_index: int) -> void:
	pass


# Tweener methods


## Virtual method. Called when the [signal Tweener.finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Tweener].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tweener_finished() -> void:
	pass


# TileData methods


## Virtual method. Called when the [signal TileData.finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [TileData].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tile_data_changed() -> void:
	pass
