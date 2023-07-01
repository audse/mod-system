# ModClassDB

The `ModClassDB` class serves as a database of all classes registered to the Mod System. It provides methods for registering and unregistering classes, as well as querying the registered classes. 

The `ModClassDB` allows the Mod System to keep track of classes that can be extended or modified by mods.

Game developers who want their classes to be modifiable through the Mod System need to ensure that they register their classes with the ModClassDB so that mods can interact with them.

## Signals

### signal class_registered(cls: RegisteredClass)

- **Description**: This signal is emitted when a class is registered to the Mod System.
- **Parameters**:
  - `cls` (RegisteredClass): The registered class.

### signal class_unregistered(cls: RegisteredClass)

- **Description**: This signal is emitted when a class is unregistered from the Mod System.
- **Parameters**:
  - `cls` (RegisteredClass): The unregistered class.

## Properties

### var registered_classes: Array[RegisteredClass]

- **Description**: An array that holds the registered classes.
- **Type**: Array[RegisteredClass]

## Methods

### func _register_plugin() -> void

- **Description**: Internal method called during plugin initialization to set up the ModClassDB.
- **Returns**: void

### func register(script: GDScript) -> RegisteredClass

- **Description**: Registers a class with the Mod System.
- **Parameters**:
  - `script` (GDScript) -> The GDScript script of the class to register.
- **Returns**: RegisteredClass - The registered class.
- **Note**: The `script` parameter should be the GDScript representing the class to be registered. This method creates a `RegisteredClass` object for the class and adds it to the `registered_classes` array. The `class_registered` signal is emitted after successful registration.

### unregister(cls: StringName) -> void

- **Description**: Unregisters a class from the Mod System.
- **Parameters**:
  - `cls` (StringName): The name of the class to unregister.
- **Returns**: void
- **Note**: The `cls` parameter should be the name of the class to unregister. This method removes the corresponding `RegisteredClass` object from the `registered_classes` array. The `class_unregistered` signal is emitted after successful unregistration.

### is_class_name_registered(cls: StringName) -> bool

- **Description**: Checks if a class name is registered with the Mod System.
- **Parameters**:
  - `cls` (StringName): The name of the class to check.
- **Returns**: bool - `true` if the class name is registered, `false` otherwise.
- **Note**: The `cls` parameter should be the name of the class to check. This method searches the `registered_classes` array for a matching class name and returns the result.

### is_script_registered(cls: Script) -> bool

- **Description**: Checks if a script is registered with the Mod System.
- **Parameters**:
  - `cls` (Script): The script to check.
- **Returns**: bool - `true` if the script is registered, `false` otherwise.
- **Note**: The `cls` parameter should be the script to check. This method searches the `registered_classes` array for a matching script and returns the result.

### get_by_name(cls: StringName) -> RegisteredClass

- **Description**: Retrieves a registered class by its name.
- **Parameters**:
  - `cls` (StringName): The name of the class to retrieve.
- **Returns**: RegisteredClass - The registered class.
- **Note**: The `cls` parameter should be the name of the class to retrieve. This method searches the `registered_classes` array for a matching class name and returns the corresponding `RegisteredClass` object.

### get_by_script(cls: Script) -> RegisteredClass

- **Description**: Retrieves a registered class by its script.
- **Parameters**:
  - `cls` (Script): The script to retrieve.
- **Returns**: RegisteredClass - The registered class.
- **Note**: The `cls` parameter should be the script to retrieve. This method searches the `registered_classes` array for a matching script and returns the corresponding `RegisteredClass` object.
