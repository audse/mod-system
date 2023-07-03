class_name ModInstanceScript_Node extends ModInstanceScript.ObjectBase


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Node: _connect_signals({
		child_entered_tree = _on_owner_child_entered_tree,
		child_exiting_tree = _on_owner_child_exiting_tree,
		child_order_changed = _on_owner_child_order_changed,
		ready = _on_owner_ready,
		renamed = _on_owner_renamed,
		replacing_by = _on_owner_replacing_by,
		tree_entered = _on_owner_tree_entered,
		tree_exiting = _on_owner_tree_exiting,
		tree_exited = _on_owner_tree_exited,
	})


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
