extends VBoxContainer


@onready var mods_enabled_checkbox := %ModsEnabledCheckBox as CheckBox
@onready var cheats_enabled_checkbox := %CheatModsEnabledCheckBox as CheckBox
@onready var mod_list := %EnabledMods


func _ready() -> void:
	render()
	mods_enabled_checkbox.toggled.connect(
		func(checked: bool) -> void:
			ModSystem.settings.are_mods_enabled = checked
			render()
	)
	cheats_enabled_checkbox.toggled.connect(
		func(checked: bool) -> void:
			ModSystem.settings.are_cheats_enabled = checked
			render()
	)


func render() -> void:
	if not is_inside_tree(): return
	
	# Render settings
	mods_enabled_checkbox.button_pressed = ModSystem.settings.are_mods_enabled
	cheats_enabled_checkbox.button_pressed = ModSystem.settings.are_cheats_enabled
	
