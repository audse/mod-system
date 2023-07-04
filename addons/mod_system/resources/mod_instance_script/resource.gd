class_name ModInstanceScript_Resource extends ModInstanceScript.ObjectBase


func _init(instance_value: ModInstance) -> void:
	super._init(instance_value)
	if instance.owner is Resource: _connect_signals({
		changed = _on_owner_changed,
		setup_local_to_scene_requested = _on_owner_setup_local_to_scene_requested,
	})
	if instance.owner is AnimationLibrary: _connect_signals({
		animation_added = _on_owner_animation_library_animation_added,
		animation_changed = _on_owner_animation_library_animation_changed,
		animation_removed = _on_owner_animation_library_animation_removed,
		animation_renamed = _on_owner_animation_library_animation_renamed,
	})
	if instance.owner is AnimationNode: _connect_signals({
		animation_node_removed = _on_owner_animation_node_removed,
		animation_node_renamed = _on_owner_animation_node_renamed,
		tree_changed = _on_owner_animation_node_tree_changed,
	})
	if instance.owner is AnimationNodeBlendSpace2D: _connect_signals({
		triangles_updated = _on_owner_animation_node_blend_space_2d_triangles_updated
	})
	if instance.owner is AnimationNodeBlendTree: _connect_signals({
		node_changed = _on_animation_node_blend_tree_node_changed
	})
	if instance.owner is AnimationNodeStateMachineTransition: _connect_signals({
		advance_condition_changed = _on_animation_node_state_machine_transition_advance_condition_changed
	})
	if instance.owner is BoneMap: _connect_signals({
		bone_map_updated = _on_owner_bone_map_updated,
		profile_updated = _on_owner_bone_map_profile_updated,
	})
	if instance.owner is ButtonGroup: _connect_signals({
		pressed = _on_owner_button_group_pressed,
	})
	if instance.owner is Curve: _connect_signals({
		range_changed = _on_owner_curve_range_changed
	})
	if instance.owner is SkeletonProfile: _connect_signals({
		profile_updated = _on_owner_skeleton_profile_updated
	})


## Virtual method. Called when the [signal Resource.changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Resource].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_changed() -> void:
	pass


## Virtual method. Called when the [signal Resource.setup_local_to_scene_requested] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Resource].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_setup_local_to_scene_requested() -> void:
	pass


# [AnimationLibrary] signals


## Virtual method. Called when the [signal AnimationLibrary.animation_added] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationLibrary].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_library_animation_added(_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationLibrary.animation_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationLibrary].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_library_animation_changed(_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationLibrary.animation_removed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationLibrary].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_library_animation_removed(_name: StringName) -> void:
	pass


## Virtual method. Called when the [signal AnimationLibrary.animation_renamed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationLibrary].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_library_animation_renamed(_name: StringName, _to_name: StringName) -> void:
	pass


# [AnimationNode] signals


## Virtual method. Called when the [signal AnimationNode.animation_node_removed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNode].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_node_removed(_object_id: int, _name: String) -> void:
	pass


## Virtual method. Called when the [signal AnimationNode.animation_node_renamed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNode].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_node_renamed(_object_id: int, _name: String, _to_name: String) -> void:
	pass


## Virtual method. Called when the [signal AnimationNode.tree_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNode].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_node_tree_changed() -> void:
	pass


# [AnimationNodeBlendSpace2D] signals


## Virtual method. Called when the [signal AnimationNodeBlendSpace2D.triangles_updated] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNodeBlendSpace2D].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_animation_node_blend_space_2d_triangles_updated() -> void:
	pass


# [AnimationNodeBlendTree] signals


## Virtual method. Called when the [signal AnimationNodeBlendTree.node_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNodeBlendTree].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_animation_node_blend_tree_node_changed(_node_name: StringName) -> void:
	pass


# [AnimationNodeStateMachineTransition] signals


## Virtual method. Called when the [signal AnimationNodeStateMachineTransition.advance_condition_changed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [AnimationNodeStateMachineTransition].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_animation_node_state_machine_transition_advance_condition_changed() -> void:
	pass


# [BoneMap] signals


## Virtual method. Called when the [signal BoneMap.bone_map_updated] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BoneMap].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_bone_map_updated() -> void:
	pass


## Virtual method. Called when the [signal BoneMap.profile_updated] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [BoneMap].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_bone_map_profile_updated() -> void:
	pass


# [ButtonGroup] signals


## Virtual method. Called when the [signal ButtonGroup.pressed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [ButtonGroup].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_button_group_pressed(_button: BaseButton) -> void:
	pass


# [Curve] signals


## Virtual method. Called when the [signal Curve.pressed] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [Curve].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_curve_range_changed() -> void:
	pass


# [SkeletonProfile] signals


## Virtual method. Called when the [signal SkeletonProfile.profile_updated] signal is emitted on the owner.
## [br]•  Only applicable if the owner extends [SkeletonProfile].
## [br]•  The owner is [member ModInstance.owner] in [member instance]
func _on_owner_skeleton_profile_updated() -> void:
	pass

