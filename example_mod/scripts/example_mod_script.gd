extends ModInstanceScript.ButtonBase

## This mod connects to a button and updates the button's text with the number of times the button
## was pressed.

## The original text of the button
var button_text: String

## The number of times the button was pressed
var num_times_pressed := 0


## This function is automatically called when the owner button is ready.
func _on_owner_ready() -> void:
	# Log to the editor console
	logs("The button is ready.")
	
	# Update the button_text state variable with the button's original text
	button_text = (instance.owner as Button).text


## This function is automatically called when the owner button is pressed.
func _on_owner_pressed() -> void:
	# Increment the number of times the button was pressed
	num_times_pressed += 1
	
	# Update the button's text to say: "<original text> (pressed x times)"
	(instance.owner as Button).text = "{0} (pressed {1} time{2})".format([
		button_text, 
		num_times_pressed,
		"s" if num_times_pressed != 1 else ""
	])
	
	# Let's also add an icon to the button to demo the asset feature
	(instance.owner as Button).icon = instance.mod.get_asset("robot").asset
