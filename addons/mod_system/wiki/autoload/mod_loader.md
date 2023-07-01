Certainly! Here's the wiki page for the `ModLoader` class:

# ModLoader

The `ModLoader` class is responsible for loading and registering mods. It recursively searches for mod files within the directories specified in the `ProjectSettings."mod_system/mod_paths"` property, loads the mods, and registers them using the `ModSystem.register` method. Mod files can have either the `.mod.tres` or `.mod.json` extension.

Please note that the `ModLoader` class is designed to work in conjunction with the `ModSystem` class, which manages the overall functionality and behavior of mods in the game.

## Inherits

`Node`

## Signals

None

## Properties

None

## Methods

### `_ready(): void`

- **Description**: Called when the node and its children are ready, after the scene tree's initialization.
- **Parameters**: None
- **Returns**: void

### `load_all_mods(): void`

- **Description**: Recursively finds all mod paths that end with `.mod.tres` or `.mod.json`, loads them, and registers them using the `ModSystem.register` method.
- **Parameters**: None
- **Returns**: void

### `load_mod(path: String): Mod`

- **Description**: Loads a mod at the specified `path` and registers it using the `ModSystem.register` method.
- **Parameters**:
  - `path` (String): The file path of the mod to load.
- **Returns**: Mod or null

### `get_mod_paths(dirs: Array[String]): Array[String]`

- **Description**: Retrieves an array of all mod paths that end with `.mod.tres` or `.mod.json` within the directories listed in the `ProjectSettings."mod_system/mod_paths"` property.
- **Parameters**:
  - `dirs` (Array[String]): An array of directories to search for mod paths.
- **Returns**: Array[String]

### `get_mod_dirs(): Array[String]`

- **Description**: Retrieves an array of all directories listed in the `ProjectSettings."mod_system/mod_paths"` property.
- **Parameters**: None
- **Returns**: Array[String]

### `is_mod_path(path: String): bool`

- **Description**: Checks if the specified `path` is in the format `*.mod.tres` or `*.mod.json`.
- **Parameters**:
  - `path` (String): The path to check.
- **Returns**: bool

---
