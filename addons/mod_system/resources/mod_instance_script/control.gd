class_name ModInstanceScript_Control extends ModInstanceScript.NodeBase


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Control: _connect_signals({
		focus_entered = _on_owner_focus_entered,
		focus_exited = _on_owner_focus_exited,
		gui_input = _on_owner_gui_input,
		minimum_size_changed = _on_owner_minimum_size_changed,
		mouse_entered = _on_owner_mouse_entered,
		mouse_exited = _on_owner_mouse_exited,
		resized = _on_owner_resized,
		size_flags_changed = _on_owner_size_flags_changed,
		theme_changed = _on_owner_theme_changed,
	})


## Virtual method. Called when the [signal Control.focus_entered] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_focus_entered() -> void:
	pass


## Virtual method. Called when the [signal Control.focus_exited] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_focus_exited() -> void:
	pass


## Virtual method. Called when the [signal Control.gui_input] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_gui_input(_event: InputEvent) -> void:
	pass


## Virtual method. Called when the [signal Control.minimum_size_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_minimum_size_changed() -> void:
	pass


## Virtual method. Called when the [signal Control.mouse_entered] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_mouse_entered() -> void:
	pass


## Virtual method. Called when the [signal Control.mouse_exited] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_mouse_exited() -> void:
	pass


## Virtual method. Called when the [signal Control.resized] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_resized() -> void:
	pass


## Virtual method. Called when the [signal Control.size_flags_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_size_flags_changed() -> void:
	pass


## Virtual method. Called when the [signal Control.theme_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_theme_changed() -> void:
	pass
