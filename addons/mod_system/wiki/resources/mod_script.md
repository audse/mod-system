# ModScript

The `ModScript` class is an extension of the `GDScript` class in the Godot game engine. It serves as a container for a script to be used as the `instance_script` of a `Mod`. When a `ModScript` is created, it automatically registers the associated class to the `ModClassDB`, saving the new `RegisteredClass` in the `registered_class` variable.

## Properties

### registered_class: RegisteredClass

- **Description**: The associated `RegisteredClass` of the script.
- **Type**: RegisteredClass

## Methods

### _init(script: GDScript) -> void

- **Description**: Initializes the `ModScript` with the provided `GDScript` object.
- **Parameters**:
  - `script` (GDScript): The GDScript object associated with the `ModScript`.
- **Returns**: void
- **Note**: This method registers the script class to the `ModClassDB` and saves the resulting `RegisteredClass` in the `registered_class` variable. The script's source code is also assigned to the `GDScript.source_code` property.

### static load_script(path: String) -> ModScript

- **Description**: Creates a new `ModScript` object from the GDScript file at the specified `path` and registers it with the `ModClassDB`.
- **Parameters**:
  - `path` (String): The path to the GDScript file.
- **Returns**: ModScript or null
- **Note**: This is a static method that can be called directly on the `ModScript` class. It loads the GDScript resource at the given path using the `ResourceLoader`, checks if it is a valid GDScript object, and creates a new `ModScript` instance if successful. If the resource cannot be loaded or is not a GDScript, it returns `null`.

### _to_string() -> String

- **Description**: Returns a string representation of the `ModScript` object.
- **Returns**: String
- **Note**: This method overrides the `_to_string` method of the `GDScript` class and replaces occurrences of "GDScript" with "ModScript" in the output string.