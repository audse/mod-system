# Mod

The `Mod` class represents a mod in the Mod System. It extends the `Resource` class and provides metadata, assets, and functionality for granting and revoking the mod to/from game objects.

## Signals

### registered

- **Description**: This signal is emitted when the mod is registered with the Mod System.

### unregistered

- **Description**: This signal is emitted when the mod is unregistered from the Mod System.

### enabled

- **Description**: This signal is emitted when the mod is enabled.

### disabled

- **Description**: This signal is emitted when the mod is disabled.

### granted(instance: ModInstance)

- **Description**: This signal is emitted when the mod is granted to an object.
- **Parameters**:
  - `instance` (ModInstance): The granted mod instance.

### revoked(instance: ModInstance)

- **Description**: This signal is emitted when the mod is revoked from an object.
- **Parameters**:
  - `instance` (ModInstance): The revoked mod instance.

## Properties

### requires_restart: bool

- **Description**: A flag indicating whether the mod requires a game restart to take effect.
- **Type**: bool

### is_cheat: bool

- **Description**: A flag indicating whether the mod provides cheats or cheat-like functionality.
- **Type**: bool

### grantable_owners: PackedStringArray

- **Description**: An array of registered class names that can receive this mod.
- **Type**: PackedStringArray

### instance_script: ModScript

- **Description**: The script to be run when the mod is granted to an object.
- **Type**: ModScript

### assets: Array[ModAsset]

- **Description**: An array of mod assets associated with the mod.
- **Type**: Array[ModAsset]

### name: String

- **Description**: The name of the mod.
- **Type**: String

### author: String

- **Description**: The author of the mod.
- **Type**: String

### version: String

- **Description**: The version of the mod.
- **Type**: String

### url: String

- **Description**: The URL where the mod can be downloaded or accessed.
- **Type**: String

### thumbnail: Texture2D

- **Description**: A thumbnail image representing the mod.
- **Type**: Texture2D

### instances: Dictionary[Object, ModInstance]

- **Description**: A dictionary that maps objects to their corresponding mod instances.
- **Type**: Dictionary[Object, ModInstance]

### is_enabled: bool (computed)

- **Description**: A computed property indicating whether the mod is currently enabled.
- **Type**: bool

## Methods

### grant(owner: Object) -> void

- **Description**: Grants the mod to the specified object.
- **Parameters**:
  - `owner` (Object): The object to grant the mod to.
- **Returns**: void
- **Note**: This method creates a mod instance for the specified object and emits the `granted` signal.

### revoke(owner: Object) -> void

- **Description**: Revokes the mod from the specified object.
- **Parameters**:
  - `owner` (Object): The object to revoke the mod from.
- **Returns**: void
- **Note**: This method removes the mod instance associated with the specified object and emits the `revoked` signal.

### get_instance(owner: Object) -> ModInstance

- **Description**: Retrieves the mod instance associated with the specified object.
- **Parameters**:
  - `owner` (Object): The object to retrieve the mod instance for.
- **Returns**: ModInstance - The mod

 instance associated with the object, or `null` if no instance exists.
- **Note**: This method returns the mod instance for the specified object. If no instance exists, it returns `null`.

### get_asset(key: String) -> ModAsset

- **Description**: Retrieves a mod asset by its key.
- **Parameters**:
  - `key` (String): The key of the asset to retrieve.
- **Returns**: ModAsset - The mod asset with the specified key, or `null` if not found.
- **Note**: This method searches the `assets` array and returns the mod asset with the matching key. If no asset is found, it returns `null`.

### _on_registered() -> void

- **Description**: This method is called when the mod is registered with the Mod System.
- **Returns**: void
- **Note**: This method is intended to be overridden by subclasses to perform additional actions when the mod is registered.

### _on_unregistered() -> void

- **Description**: This method is called when the mod is unregistered from the Mod System.
- **Returns**: void
- **Note**: This method is intended to be overridden by subclasses to perform additional actions when the mod is unregistered.

### _on_enabled() -> void

- **Description**: This method is called when the mod is enabled.
- **Returns**: void
- **Note**: This method is intended to be overridden by subclasses to perform additional actions when the mod is enabled.

### _on_disabled() -> void

- **Description**: This method is called when the mod is disabled.
- **Returns**: void
- **Note**: This method is intended to be overridden by subclasses to perform additional actions when the mod is disabled.

### get_identifier() -> String

- **Description**: Retrieves the unique identifier of the mod.
- **Returns**: String - The mod's unique identifier.
- **Note**: This method returns a unique identifier for the mod, which can be used to differentiate it from other mods.
