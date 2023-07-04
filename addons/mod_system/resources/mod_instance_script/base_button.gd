class_name ModInstanceScript_BaseButton extends ModInstanceScript.ControlBase


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is BaseButton: _connect_signals({
		button_down = _on_owner_button_down,
		button_up = _on_owner_button_up,
		pressed = _on_owner_pressed,
		toggled = _on_owner_toggled,
	})
	if instance.owner is ColorPickerButton: _connect_signals({
		color_changed = _on_owner_color_changed,
		picker_created = _on_owner_color_picker_created,
		popup_closed = _on_owner_color_popup_closed,
	})
	if instance.owner is MenuButton: _connect_signals({
		about_to_popup = _on_owner_menu_about_to_popup,
	})
	if instance.owner is OptionButton: _connect_signals({
		item_focused = _on_owner_option_item_focused,
		item_selected = _on_owner_option_item_selected,
	})


## Virtual method. Called when the [signal BaseNutton.button_down] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BaseButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_button_down() -> void:
	pass


## Virtual method. Called when the [signal BaseNutton.button_up] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BaseButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_button_up() -> void:
	pass


## Virtual method. Called when the [signal BaseNutton.pressed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BaseButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_pressed() -> void:
	pass


## Virtual method. Called when the [signal BaseNutton.toggled] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BaseButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_toggled(_button_pressed: bool) -> void:
	pass


# [ColorPickerButton] signals

## Virtual method. Called when the [signal ColorPickerButton.color_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [ColorPickerButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_color_changed(_color: Color) -> void:
	pass


## Virtual method. Called when the [signal ColorPickerButton.picked_created] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [ColorPickerButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_color_picker_created() -> void:
	pass


## Virtual method. Called when the [signal ColorPickerButton.popup_closed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [ColorPickerButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_color_popup_closed() -> void:
	pass


# [MenuButton] signals

## Virtual method. Called when the [signal MenuButton.about_to_popup] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Menubutton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_menu_about_to_popup() -> void:
	pass


# [OptionButton] signals

## Virtual method. Called when the [signal OptionButton.item_focused] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [OptionButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_option_item_focused(_index: int) -> void:
	pass


## Virtual method. Called when the [signal OptionButton.item_selected] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [OptionButton].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_option_item_selected(_index: int) -> void:
	pass
