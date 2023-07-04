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
	if instance.owner is AnimationPlayer: _connect_signals({
		animation_changed = _on_owner_animation_player_animation_changed,
		animation_finished = _on_owner_animation_player_animation_finished,
		animation_libraries_updated = _on_owner_animation_player_animation_libraries_updated,
		animation_list_changed = _on_owner_animation_player_animation_list_changed,
		animation_started = _on_owner_animation_player_animation_started,
		caches_cleared = _on_owner_animation_player_caches_cleared,
	})
	if instance.owner is AnimationTree: _connect_signals({
		animation_finished = _on_owner_animation_tree_animation_finished,
		animation_player_changed = _on_owner_animation_tree_animation_player_changed,
		animation_started = _on_owner_animation_tree_animation_started,
	})
	if instance.owner is AudioStreamPlayer: _connect_signals({
		finished = _on_owner_audio_stream_player_finished,
	})
	if instance.owner is CanvasItem: _connect_signals({
		draw = _on_owner_draw,
		hidden = _on_owner_hidden,
		item_rect_changed = _on_owner_item_rect_changed,
		visibility_changed = _on_owner_visibility_changed,
	})
	if instance.owner is CanvasLayer: _connect_signals({
		visibility_changed = _on_owner_canvas_layer_visibility_changed,
	})
	if instance.owner is HTTPRequest: _connect_signals({
		request_completed = _on_owner_http_request_completed,
	})
	if instance.owner is MultiplayerSpawner: _connect_signals({
		despawned = _on_owner_multiplayer_spawner_despawned,
		spawned = _on_owner_multiplayer_spawner_spawned,
	})
	if instance.owner is MultiplayerSynchronizer: _connect_signals({
		delta_synchronized = _on_owner_multiplayer_synchronizer_delta_synchronized,
		synchronized = _on_owner_multiplayer_synchronizer_synchronized,
		visibility_changed = _on_owner_multiplayer_synchronizer_visibility_changed,
	})
	if instance.owner is NavigationAgent2D or instance.owner is NavigationAgent3D: _connect_signals({
		link_reached = _on_owner_navigation_agent_link_reached,
		navigation_finished = _on_owner_navigation_agent_navigation_finished,
		path_changed = _on_owner_navigation_agent_path_changed,
		target_reached = _on_owner_navigation_agent_target_reached,
		velocity_computed = _on_owner_navigation_agent_velocity_computed,
		waypoint_reached = _on_owner_navigation_agent_waypoint_reached,
	})
	if instance.owner is Timer: _connect_signals({
		timeout = _on_owner_timeout,
	})
	if instance.owner is Viewport: _connect_signals({
		gui_focus_changed = _on_owner_viewport_gui_focus_changed,
		size_changed = _on_owner_viewport_size_changed,
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


# [AnimationPlayer] signals


## Virtual method. Called when the [signal AnimationPlayer.animation_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_animation_changed(_old_name: StringName, _new_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationPlayer.animation_finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_animation_finished(_anim_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationPlayer.animation_libraries_updated] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_animation_libraries_updated() -> void:
	pass


## Virtual method. Called when the [signal AnimationPlayer.animation_list_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_animation_list_changed() -> void:
	pass


## Virtual method. Called when the [signal AnimationPlayer.animation_started] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_animation_started(_anim_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationPlayer.caches_cleared] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_player_caches_cleared() -> void:
	pass


# [AnimationTree] signals


## Virtual method. Called when the [signal AnimationTree.animation_finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationTree].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_tree_animation_finished(_anim_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationTree.animation_player_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationTree].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_tree_animation_player_changed() -> void:
	pass


## Virtual method. Called when the [signal AnimationTree.animation_started] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationTree].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_tree_animation_started(_anim_name: StringName) -> void:
	pass


# [AudioStreamPlayer] signals


## Virtual method. Called when the [signal AudioStreamPlayer.finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AudioStreamPlayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_audio_stream_player_finished() -> void:
	pass


# [CanvasItem] signals


## Virtual method. Called when the [signal CanvasItem.draw] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [CanvasItem].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_draw() -> void:
	pass


## Virtual method. Called when the [signal CanvasItem.hidden] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [CanvasItem].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_hidden() -> void:
	pass


## Virtual method. Called when the [signal CanvasItem.item_rect_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [CanvasItem].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_item_rect_changed() -> void:
	pass


## Virtual method. Called when the [signal CanvasItem.visibility_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [CanvasItem].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_visibility_changed() -> void:
	pass


# [CanvasLayer] signals


## Virtual method. Called when the [signal CanvasLayer.visibility_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [CanvasLayer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_canvas_layer_visibility_changed() -> void:
	pass


# [HTTPRequest] signals


## Virtual method. Called when the [signal HTTPRequest.request_completed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [HTTPRequest].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_http_request_completed(_result: int, _response_code: int, _headers: PackedStringArray, _body: PackedByteArray) -> void:
	pass


# [MultiplayerSpawner] signals


## Virtual method. Called when the [signal MultiplayerSpawner.despawned] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [MultiplayerSpawner].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_multiplayer_spawner_despawned(_node: Node) -> void:
	pass


## Virtual method. Called when the [signal MultiplayerSpawner.spawned] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [MultiplayerSpawner].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_multiplayer_spawner_spawned(_node: Node) -> void:
	pass


# [MultiplayerSynchronizer] signals


## Virtual method. Called when the [signal MultiplayerSynchronizer.delta_synchronized] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [MultiplayerSynchronizer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_multiplayer_synchronizer_delta_synchronized() -> void:
	pass


## Virtual method. Called when the [signal MultiplayerSynchronizer.synchronized] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [MultiplayerSynchronizer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_multiplayer_synchronizer_synchronized() -> void:
	pass


## Virtual method. Called when the [signal MultiplayerSynchronizer.visibility_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [MultiplayerSynchronizer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_multiplayer_synchronizer_visibility_changed(_for_peer: int) -> void:
	pass


# [NavigationAgent2D] & [NavigationAgent3D] signals


## Virtual method. Called when the [signal NavigationAgent2D.link_reached] or [signal NavigationAgent3D.link_reached] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_link_reached(_details: Dictionary) -> void:
	pass


## Virtual method. Called when the [signal NavigationAgent2D.navigation_finished] or [signal NavigationAgent3D.navigation_finished] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_navigation_finished() -> void:
	pass


## Virtual method. Called when the [signal NavigationAgent2D.path_changed] or [signal NavigationAgent3D.path_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_path_changed() -> void:
	pass


## Virtual method. Called when the [signal NavigationAgent2D.target_reached] or [signal NavigationAgent3D.target_reached] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_target_reached() -> void:
	pass


## Virtual method. Called when the [signal NavigationAgent2D.velocity_computed] or [signal NavigationAgent3D.velocity_computed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_velocity_computed(_safe_velocity) -> void:
	pass


## Virtual method. Called when the [signal NavigationAgent2D.waypoint_reached] or [signal NavigationAgent3D.waypoint_reached] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [NavigationAgent2D] or [NavigationAgent3D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_navigation_agent_waypoint_reached(_details: Dictionary) -> void:
	pass


# [Timer] signals


## Virtual method. Called when the [signal Timer.timeout] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Timer].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_timeout() -> void:
	pass


# [Viewport] signals


## Virtual method. Called when the [signal Viewport.gui_focus_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Viewport].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_viewport_gui_focus_changed(_node: Control) -> void:
	pass


## Virtual method. Called when the [signal Viewport.size_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Viewport].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_viewport_size_changed() -> void:
	pass


