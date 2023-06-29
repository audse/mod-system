class_name ModInstanceScript extends Resource

## The main script for handling the effects of your mods
##
## This is the class that should be extended when writing your mods. This is the script that will
## be called in-game and be able to effect gameplay. See [member Mod.instance_script].

## The [ModInstance] of which this script belongs
var instance: ModInstance = null


func _init(instance_value: ModInstance) -> void:
	instance = instance_value
	
	instance.mod.granted.connect(func(_instance): _on_granted())
	instance.mod.revoked.connect(func(_instance): _on_revoked())
	
	# TODO more connections (control, node2d, node3d, etc)
	var owner_connections := {
		child_entered_tree = _on_owner_child_entered_tree,
		child_exiting_tree = _on_owner_child_exiting_tree,
		child_order_changed = _on_owner_child_order_changed,
		gui_input = _on_owner_gui_input,
		ready = _on_owner_ready,
		renamed = _on_owner_renamed,
		replacing_by = _on_owner_replacing_by,
		tree_entered = _on_owner_tree_entered,
		tree_exiting = _on_owner_tree_exiting,
		tree_exited = _on_owner_tree_exited,
	}
	
	for signal_name in owner_connections:
		if instance.owner.has_signal(signal_name): 
			instance.owner.connect(signal_name, owner_connections[signal_name])


## If logging is enabled (see [member ModSettings.enable_logging]), prints the [code]message[/code]
## to the terminal with contextual information about the current [Mod].
## (in [member instance], see [member ModInstance.mod])
func logs(message: String) -> void:
	ModSystemUtils.mod_log(instance.mod, message)


## Virtual method. Called when the mod is granted to the owner.
## [br]•  The granted mod is [member ModInstance.mod] in [member instance]
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_granted() -> void:
	pass


## Virtual method. Called when the mod is revoked from the owner.
## [br]•  The revoked mod is [member ModInstance.mod] in [member instance]
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_revoked() -> void:
	pass


## Virtual method. Called when the [signal Node.child_entered_tree] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_child_entered_tree(_node: Node) -> void:
	pass


## Virtual method. Called when the [signal Node.child_exiting_tree] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_child_exiting_tree(_node: Node) -> void:
	pass


## Virtual method. Called when the [signal Node.child_order_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_child_order_changed() -> void:
	pass


## Virtual method. Called when the [signal Control.gui_input] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Control].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_gui_input(_event: InputEvent) -> void:
	pass


## Virtual method. Called when the [signal Node.tree_entered] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tree_entered() -> void:
	pass


## Virtual method. Called when the [signal Node.ready] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_ready() -> void:
	pass


## Virtual method. Called when the [signal Node.renamed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_renamed() -> void:
	pass


## Virtual method. Called when the [signal Node.replacing_by] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_replacing_by(_node: Node) -> void:
	pass


## Virtual method. Called when the [signal Node.tree_exiting] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tree_exiting() -> void:
	pass


## Virtual method. Called when the [signal Node.tree_exited] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Node].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_tree_exited() -> void:
	pass
