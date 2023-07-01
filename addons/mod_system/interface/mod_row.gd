extends HBoxContainer

signal toggled(checked: bool)

@export var mod: Mod = null
@export var is_checked: bool = false

# Nodes
@onready var checkbox := %CheckBox as CheckBox
@onready var thumbnail := %Thumbnail as TextureRect
@onready var label := %Label as RichTextLabel
@onready var cheat_label := %CheatLabel as Label

# Theme
@onready var font_color := label.get_theme_color("default_color")


func _ready() -> void:
	checkbox.toggled.connect(_on_toggled)
	render()


func _on_toggled(checked: bool) -> void:
	is_checked = checked
	toggled.emit(checked)


func render() -> void:
	if is_inside_tree() and mod != null:
		label.text = _create_label_content()
		thumbnail.texture = mod.thumbnail
		cheat_label.modulate = font_color
		cheat_label.visible = mod.is_cheat
		
		checkbox.toggled.disconnect(_on_toggled)
		checkbox.button_pressed = is_checked
		checkbox.toggled.connect(_on_toggled)


func _create_label_content() -> String:
	if mod == null: return ""
	var dimmed_color := _get_dimmed_font_color()
	var name_text := "[b]%s[/b]" % mod.name
	var version_text := "[color={color}]v{version}[/color]".format({ 
		color = dimmed_color, 
		version = mod.version 
	}) if not mod.version.is_empty() else ""
	var author_text := "[color={color}]by {author}[/color]".format({
		color = dimmed_color,
		author = mod.author
	}) if not mod.author.is_empty() else ""
	var lower_line_text := "[url={url}]{author_text}[/url]".format({
		url = mod.url,
		author_text = author_text
	}) if not mod.url.is_empty() else author_text
	
	return "{name} {version}\n{lower_line}".format({
		name = name_text,
		version = version_text,
		lower_line = lower_line_text
	})


func _get_dimmed_font_color() -> String:
	return "#{0}aa".format([font_color.to_html(false)])
