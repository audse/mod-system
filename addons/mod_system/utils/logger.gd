class_name ModSystemLogger extends Object

## Handles contextual logging for the Mod System

## Logs the [code]message[/code] to the console, with context about the calling [Mod].
## If [member ModSettings.enable_logging] is [code]false[/code], nothing will be logged.
static func mod_log(mod: Mod, message: String) -> void:
	if ModSystem and ModSystem.settings.enable_logging: print_rich(
		"[color=gray][ModSystem:{mod}][/color] [color=white]{message}[/color]".format({ 
			mod = mod.name,
			message = message 
		})
	)


## Logs the [code]message[/code] to the console.
## If [member ModSettings.enable_logging] is [code]false[/code], nothing will be logged.
static func logs(message: String) -> void:
	if ModSystem and ModSystem.settings.enable_logging: print_rich(
		"[color=gray][ModSystem][/color] [color=white]{message}[/color]".format({ 
			message = message 
		})
	)
