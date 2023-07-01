# ModInstanceScript

The `ModInstanceScript` is a script associated with a mod instance in the Mod System. It contains various virtual methods that can be overridden to customize the behavior of the mod when granted to an owner object. It also provides a `logs` method for logging messages with contextual information about the current mod.

## Properties

### instance: ModInstance

- **Description**: The mod instance associated with this script.
- **Type**: ModInstance

## Methods

### _init(instance_value: ModInstance) -> void

- **Description**: Initializes the script with the associated mod instance.
- **Parameters**:
  - `instance_value` (ModInstance): The mod instance associated with this script.
- **Returns**: void

### logs(message: String) -> void

- **Description**: Prints the specified message to the terminal if logging is enabled.
- **Parameters**:
  - `message` (String): The message to log.
- **Returns**: void
- **Note**: This method can be used to log messages with contextual information about the current mod instance. The logging functionality is determined by the `enable_logging` setting in the `ModSettings`.

### _on_granted() -> void

- **Description**: Called when the mod is granted to the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the mod is granted.

### _on_revoked() -> void

- **Description**: Called when the mod is revoked from the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the mod is revoked.

### _on_owner_child_entered_tree(_node: Node) -> void

- **Description**: Called when the `Node.child_entered_tree` signal is emitted on the owner object.
- **Parameters**:
  - `_node` (Node): The child node that entered the tree.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when a child node enters the tree. This method is applicable only if the owner object extends `Node`.

### _on_owner_child_exiting_tree(_node: Node) -> void

- **Description**: Called when the `Node.child_exiting_tree` signal is emitted on the owner object.
- **Parameters**:
  - `_node` (Node): The child node that is exiting the tree.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when a child node is exiting the tree. This method is applicable only if the owner object extends `Node`.

### _on_owner_child_order_changed() -> void

- **Description**: Called when the `Node.child_order_changed` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the order of child nodes changes. This method is applicable only if the owner object extends `Node`.

### _on_owner_gui_input(_event: InputEvent) -> void

- **Description**: Called when the `Control.gui_input` signal is emitted on the owner object.
- **Parameters**:
  - `_event` (InputEvent): The input event that occurred.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to handle GUI input events. This method is applicable only if the owner object extends `Control`.

### _on_owner_tree_entered() -> void

- **Description**: Called when the `

Node.tree_entered` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object enters the tree. This method is applicable only if the owner object extends `Node`.

### _on_owner_ready() -> void

- **Description**: Called when the `Node.ready` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object is ready. This method is applicable only if the owner object extends `Node`.

### _on_owner_renamed() -> void

- **Description**: Called when the `Node.renamed` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object is renamed. This method is applicable only if the owner object extends `Node`.

### _on_owner_replacing_by(_node: Node) -> void

- **Description**: Called when the `Node.replacing_by` signal is emitted on the owner object.
- **Parameters**:
  - `_node` (Node): The node that will replace the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object is being replaced by another node. This method is applicable only if the owner object extends `Node`.

### _on_owner_tree_exiting() -> void

- **Description**: Called when the `Node.tree_exiting` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object is exiting the tree. This method is applicable only if the owner object extends `Node`.

### _on_owner_tree_exited() -> void

- **Description**: Called when the `Node.tree_exited` signal is emitted on the owner object.
- **Returns**: void
- **Note**: This method is a virtual method that can be overridden in subclasses to perform custom actions when the owner object has exited the tree. This method is applicable only if the owner object extends `Node`.