# ModSettings

The `ModSettings` class is a resource that stores a user's preferences for their installed mods. It provides options for enabling or disabling mods, controlling cheat mod behavior, managing enabled mods, and handling logging settings.

## Properties

### are_mods_enabled: bool

- **Description**: Determines whether mods are enabled to affect the game. If set to `true`, any mod can be enabled and have an effect. If set to `false`, all mod effects will be blocked from being enabled and granted.
- **Type**: bool
- **Export**: Yes

### are_cheats_enabled: bool

- **Description**: Determines whether cheat mods can be enabled to affect the game. This property is only applicable when `are_mods_enabled` is also `true`. If set to `true`, cheat mods can be enabled and granted. If set to `false`, all cheat mods will be blocked from being enabled and granted.
- **Type**: bool
- **Export**: Yes

### enabled_mods: Array[String]

- **Description**: An array of currently enabled mods. Each element is a string representing the identifier of a mod. The identifier is obtained using the `Mod.get_identifier()` method.
- **Type**: Array[String]
- **Export**: Yes

### enable_logging: bool

- **Description**: Determines whether mods are allowed to print messages to the console with contextual information. This property is useful for debugging purposes.
- **Type**: bool
- **Export**: Yes

### save_path: String (static)

- **Description**: The path where this resource will be saved. The value is obtained from the `ProjectSettings.mod_system/mod_settings_save_path` property.
- **Type**: String
- **Getter**: ModSystemUtils.get_setting(ModSystemUtils.Settings.ModSettingsSavePath)

## Methods

### is_enabled(mod: Mod) -> bool

- **Description**: Returns `true` if the specified mod is enabled (included in the `enabled_mods` array).
- **Parameters**:
  - `mod` (Mod): The mod to check.
- **Returns**: bool

### can_enable(mod: Mod) -> bool

- **Description**: Returns `true` if the specified mod can be enabled. This depends on the current state of `are_mods_enabled`, `enabled_mods`, and the mod's cheat status (`is_cheat`).
- **Parameters**:
  - `mod` (Mod): The mod to check.
- **Returns**: bool

### can_disable(mod: Mod) -> bool

- **Description**: Returns `true` if the specified mod can be disabled. This depends on whether the mod is currently enabled (included in the `enabled_mods` array).
- **Parameters**:
  - `mod` (Mod): The mod to check.
- **Returns**: bool

### enable_mod(mod: Mod) -> void

- **Description**: Enables the specified mod and saves the settings.
- **Parameters**:
  - `mod` (Mod): The mod to enable.

### disable_mod(mod: Mod) -> void

- **Description**: Disables the specified mod and saves the settings.
- **Parameters**:
  - `mod` (Mod): The mod to disable.

### save() -> void

- **Description**: Saves the `ModSettings` resource to the designated save path (`save_path`). This method is automatically called when any property is changed. It uses `ResourceSaver.save()` to save the resource.
- **Note**: This method

 emits the "changed" signal to indicate that the settings have been saved.

### static load_settings() -> ModSettings

- **Description**: Loads the `ModSettings` resource if it exists at the designated save path (`save_path`). If the resource does not exist, a new `ModSettings` object is created.
- **Returns**: ModSettings
- **Note**: This is a static method that can be called directly on the `ModSettings` class.