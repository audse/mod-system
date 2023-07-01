# ModSystem

The `ModSystem` class is a singleton that handles the management of mods within the game. It provides methods for registering, enabling, disabling, granting, and revoking mods. The `ModSystem` is responsible for maintaining the state of mods and their instances, as well as facilitating communication between mods and the game objects they affect.

## Signals

### mod_registered(mod: Mod)

- **Description**: This signal is emitted when a mod is registered with the Mod System.
- **Parameters**:
  - `mod` (Mod): The registered mod.

### mod_unregistered(mod: Mod)

- **Description**: This signal is emitted when a mod is unregistered from the Mod System.
- **Parameters**:
  - `mod` (Mod): The unregistered mod.

### mod_enabled(mod: Mod)

- **Description**: This signal is emitted when a mod is enabled.
- **Parameters**:
  - `mod` (Mod): The enabled mod.

### mod_disabled(mod: Mod)

- **Description**: This signal is emitted when a mod is disabled.
- **Parameters**:
  - `mod` (Mod): The disabled mod.

### mod_granted(instance: ModInstance)

- **Description**: This signal is emitted when a mod is granted to an object.
- **Parameters**:
  - `instance` (ModInstance): The granted mod instance.

### mod_revoked(instance: ModInstance)

- **Description**: This signal is emitted when a mod is revoked from an object.
- **Parameters**:
  - `instance` (ModInstance): The revoked mod instance.

## Properties

### registered_mods: Array[Mod]

- **Description**: An array that holds the registered mods.
- **Type**: Array[Mod]

### settings: ModSettings

- **Description**: An instance of the `ModSettings` class that stores the configuration settings for the Mod System.
- **Type**: ModSettings

## Methods

### initialize(mod_owner: Object) -> void

- **Description**: Initializes the Mod System for accepting mods in the specified `mod_owner` object.
- **Parameters**:
  - `mod_owner` (Object): The object to initialize for accepting mods.
- **Returns**: void
- **Note**: This method registers the `mod_owner` object with the `ModClassDB` and grants all possible mods to the object.

### register(mod: Mod) -> void

- **Description**: Registers a mod with the Mod System.
- **Parameters**:
  - `mod` (Mod): The mod to register.
- **Returns**: void
- **Note**: This method adds the specified mod to the `registered_mods` array. The `mod_registered` signal is emitted after successful registration.

### unregister(mod: Mod) -> void

- **Description**: Unregisters a mod from the Mod System.
- **Parameters**:
  - `mod` (Mod): The mod to unregister.
- **Returns**: void
- **Note**: This method removes the specified mod from the `registered_mods` array. The `mod_unregistered` signal is emitted after successful unregistration.

### enable(mod: Mod) -> void

- **Description**: Enables a mod.
- **Parameters**:
  - `mod` (Mod): The mod to enable.
- **Returns**: void
- **Note**: This method enables the specified mod and emits the `mod_enabled` signal.

### disable(mod: Mod) -> void

- **Description**: Disables a mod.
- **Parameters**:
  - `mod` (Mod): The mod to disable.
- **Returns**: void
- **Note**: This method disables the specified mod and emits the `

mod_disabled` signal.

### enable_all() -> void

- **Description**: Enables all registered mods.
- **Returns**: void
- **Note**: This method enables all mods in the `registered_mods` array and emits the `mod_enabled` signal for each enabled mod.

### disable_all() -> void

- **Description**: Disables all registered mods.
- **Returns**: void
- **Note**: This method disables all mods in the `registered_mods` array and emits the `mod_disabled` signal for each disabled mod.

### grant(mod: Mod, mod_owner: Object) -> void

- **Description**: Grants a mod to an object.
- **Parameters**:
  - `mod` (Mod): The mod to grant.
  - `mod_owner` (Object): The object to grant the mod to.
- **Returns**: void
- **Note**: This method grants the specified mod to the specified mod_owner object and emits the `mod_granted` signal.

### grant_all(mod_owner: Object) -> void

- **Description**: Grants all possible mods to an object.
- **Parameters**:
  - `mod_owner` (Object): The object to grant the mods to.
- **Returns**: void
- **Note**: This method grants all possible mods to the specified mod_owner object and emits the `mod_granted` signal for each granted mod.

### revoke(mod: Mod, mod_owner: Object) -> void

- **Description**: Revokes a mod from an object.
- **Parameters**:
  - `mod` (Mod): The mod to revoke.
  - `mod_owner` (Object): The object to revoke the mod from.
- **Returns**: void
- **Note**: This method revokes the specified mod from the specified mod_owner object and emits the `mod_revoked` signal.

### revoke_all(mod_owner: Object) -> void

- **Description**: Revokes all possible mods from an object.
- **Parameters**:
  - `mod_owner` (Object): The object to revoke the mods from.
- **Returns**: void
- **Note**: This method revokes all possible mods from the specified mod_owner object and emits the `mod_revoked` signal for each revoked mod.

### get_grantable_mods(mod_owner: Object) -> Array[Mod]

- **Description**: Returns an array of all mods that can be granted to the specified object.
- **Parameters**:
  - `mod_owner` (Object): The object to retrieve grantable mods for.
- **Returns**: Array[Mod] - An array of grantable mods.
- **Note**: This method searches the `registered_mods` array and returns all mods where the `Mod.grantable_owners` property contains the name of the registered class of the `mod_owner` object.

### get_mod_by_id(id: String) -> Mod

- **Description**: Retrieves a mod by its ID.
- **Parameters**:
  - `id` (String): The ID of the mod to retrieve.
- **Returns**: Mod - The mod with the specified ID.
- **Note**: This method searches the `registered_mods` array and returns the mod with the matching ID.
