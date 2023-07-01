extends VBoxContainer

const ModRow := preload("mod_row.tscn")


@export var mods: Array[Mod] = []


## [Dictionary][[Mod], [bool]]
var is_checked := {}

## [Dictionary][[Mod], [bool]]
var is_dimmed := {}

## [Dictionary][[Mod], [ModRow]]
var mod_rows := {}


func _ready() -> void:
	render()


func render() -> void:
	if not is_inside_tree(): return
	# Remove outdated rows
	for mod in mod_rows.keys():
		if not mod in mods: 
			mod_rows[mod].queue_free()
			mod_rows.erase(mod)
	# Add/update rest of rows
	for mod in mods:
		if mod in mod_rows: update_row(mod)
		else: add_row(mod)


func add_row(mod: Mod) -> void:
	var row := ModRow.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	mod_rows[mod] = row
	row.toggled.connect(_on_toggled.bind(mod))
	add_child(row)
	update_row(mod)


func update_row(mod: Mod) -> void:
	if not mod in mod_rows: return
	var row: Control = mod_rows[mod]
	row.mod = mod
	row.is_checked = is_checked.get(mod, false)
	row.modulate.a = 1.0 if not is_dimmed.get(mod, false) else 0.5
	row.render()


func _on_toggled(checked: bool, mod: Mod) -> void:
	is_checked[mod] = checked
	
