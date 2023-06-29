class_name ModInstanceScript extends Resource

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


func logs(message: String) -> void:
	ModSystemUtils.mod_log(instance.mod, message)


func _on_granted() -> void:
	pass


func _on_revoked() -> void:
	pass


func _on_owner_child_entered_tree(_node: Node) -> void:
	pass


func _on_owner_child_exiting_tree(_node: Node) -> void:
	pass


func _on_owner_child_order_changed() -> void:
	pass


func _on_owner_gui_input(_event: InputEvent) -> void:
	pass


func _on_owner_tree_entered() -> void:
	pass


func _on_owner_ready() -> void:
	pass


func _on_owner_renamed() -> void:
	pass


func _on_owner_replacing_by(_node: Node) -> void:
	pass


func _on_owner_tree_exiting() -> void:
	pass


func _on_owner_tree_exited() -> void:
	pass
