Certainly! Here's an updated version of the wiki page for the `RegisteredClass` class, taking into account its registration in `ModClassDB`:

# RegisteredClass

The `RegisteredClass` class represents a registered class in the `ModClassDB`. It defines a script associated with a unique class name and provides information about the class, including its name, the script it is associated with, and its parent class.

## Properties

### name: StringName

- **Description**: The unique name of the registered class. It can be either the `Script` resource path or an explicitly provided name.
- **Type**: StringName

### cls: Script

- **Description**: The `Script` instance associated with the registered class.
- **Type**: Script

### parent: RegisteredClass

- **Description**: The parent class of the registered class. It is another `RegisteredClass` object.
- **Type**: RegisteredClass
- **Default**: `null`

## Methods

### _init(name_value: StringName, cls_value: Script, parent_value: RegisteredClass = null): void

- **Description**: Initializes a new `RegisteredClass` object with the given `name`, `cls`, and `parent`.
- **Parameters**:
  - `name_value` (StringName): The unique name of the registered class.
  - `cls_value` (Script): The `Script` instance associated with the registered class.
  - `parent_value` (RegisteredClass, optional): The parent class of the registered class. Defaults to `null`.

### from_script(script: GDScript): RegisteredClass

- **Description**: Creates a new `RegisteredClass` object by parsing the class name from the `GDScript` script's `class_name` declaration or the `resource_path` if the class name is empty. It also parses the parent class from the `extends` declaration.
- **Parameters**:
  - `script` (GDScript): The `GDScript` instance representing the script.
- **Returns**: RegisteredClass

### has_ancestor(ancestor: RegisteredClass): bool

- **Description**: Checks whether the `RegisteredClass` or any of its parent classes is the specified `ancestor` class.
- **Parameters**:
  - `ancestor` (RegisteredClass): The `RegisteredClass` representing the ancestor class to check.
- **Returns**: bool