# ModSystem

[**See the code at `mod_system.gd`**](https://github.com/audse/mod-system/tree/main/addons/mod_system/autoload/mod_system.gd)

## Description

**Inherits `Node`**

The `ModSystem` class is a singleton that handles the management of mods within the game. It provides methods for installing, enabling, disabling, granting, and revoking mods. The `ModSystem` is responsible for maintaining the state of mods and their instances, as well as facilitating communication between mods and the game objects they affect.

***

## Signals

### mod_installed

```gdscript
signal mod_installed(mod: Mod)
```

This signal is emitted when a mod is installed with the Mod System.

**Parameters**

| Name  | Type         | Description        |
| :---- | :----------- | :----------------- |
| `mod` | [`Mod`](Mod) | The installed mod. |

***

### mod_uninstalled

```gdscript
signal mod_uninstalled(mod: Mod)
```

This signal is emitted when a mod is uninstalled from the Mod System.

**Parameters**

| Name  | Type         | Description          |
| :---- | :----------- | :------------------- |
| `mod` | [`Mod`](Mod) | The uninstalled mod. |

***

### mod_enabled

```gdscript
signal mod_enabled(mod: Mod)
```

This signal is emitted when a mod is enabled.

**Parameters**

| Name  | Type         | Description      |
| :---- | :----------- | :--------------- |
| `mod` | [`Mod`](Mod) | The enabled mod. |

***

### mod_disabled

```gdscript
signal mod_disabled(mod: Mod)
```

This signal is emitted when a mod is disabled.

**Parameters**

| Name  | Type         | Description       |
| :---- | :----------- | :---------------- |
| `mod` | [`Mod`](Mod) | The disabled mod. |

***

### mod_granted

```gdscript
signal mod_granted(instance: ModInstance)
```

This signal is emitted when a mod is granted to an object.

**Parameters**

| Name       | Type                         | Description               |
| :--------- | :--------------------------- | :------------------------ |
| `instance` | [`ModInstance`](ModInstance) | The granted mod instance. |

***

### mod_revoked

```gdscript
signal mod_revoked(instance: ModInstance)
```

This signal is emitted when a mod is revoked from an object.

**Parameters**

| Name       | Type                         | Description               |
| :--------- | :--------------------------- | :------------------------ |
| `instance` | [`ModInstance`](ModInstance) | The revoked mod instance. |

***

## Properties

### installed_mods

```gdscript
var installed_mods: Array[Mod]
```

An array that holds the installed mods.

**Type**

`Array`[[`Mod`](Mod)]

***

### settings

```gdscript
var settings: ModSettings
```

An instance of the [`ModSettings`](Modsettings) class, stores the user's configuration settings for the Mod System.

**Type**

[`ModSettings`](ModSettings)

***

## Methods

### initialize

```gdscript
func initialize(mod_owner: Object) -> void
```

Initializes the Mod System for accepting mods in the specified `mod_owner` object.

This method registers the `mod_owner` object with the `ModClassDB` and grants all possible mods to the object.

**Parameters**

| Name        | Type     | Description                        |
| :---------- | :------- | :--------------------------------- |
| `mod_owner` | `Object` | The object to initialize for mods. |

**Returns**

`void`

***

### install

```gdscript
func install(mod: Mod) -> void
```

Installs a mod to the Mod System.

This method adds the specified mod to the `installed_mods` array. The `mod_installed` signal is emitted after successful registration.

**Parameters**

| Name  | Type         | Description         |
| :---- | :----------- | :------------------ |
| `mod` | [`Mod`](Mod) | The mod to install. |

**Returns**

`void`

***

### uninstall

```gdscript
func uninstall(mod: Mod) -> void
```

Uninstalls a mod from the Mod System.

This method removes the specified mod from the `installed_mods` array. The `mod_uninstalled` signal is emitted after successful unregistration.

**Parameters**

| Name  | Type         | Description           |
| :---- | :----------- | :-------------------- |
| `mod` | [`Mod`](Mod) | The mod to uninstall. |

**Returns**

`void`

***

### enable

```gdscript
func enable(mod: Mod) -> void
```

Enables a mod.

This method enables the specified mod and emits the `mod_enabled` signal.

**Parameters**

| Name  | Type         | Description        |
| :---- | :----------- | :----------------- |
| `mod` | [`Mod`](Mod) | The mod to enable. |

**Returns**

`void`

***

### disable

```gdscript
func disable(mod: Mod) -> void
```

Disables a mod.

This method disables the specified mod and emits the `mod_disabled` signal.

**Parameters**

| Name  | Type         | Description         |
| :---- | :----------- | :------------------ |
| `mod` | [`Mod`](Mod) | The mod to disable. |

**Returns**

`void`

***

### enable_all

```gdscript
func enable_all() -> void
```

Enables all installed mods.

This method enables all mods in the `installed_mods` array and emits the `mod_enabled` signal for each enabled mod.

**Returns**

`void`

***

### disable_all

```gdscript
func disable_all() -> void
```

Disables all installed mods.

This method disables all mods in the `installed_mods` array and emits the `mod_disabled` signal for each disabled mod.

**Returns**

`void`

***

### grant

```gdscript
func grant(mod: Mod, mod_owner: Object) -> void
```

Grants a mod to an object.

This method grants the specified mod to the specified mod_owner object and emits the `mod_granted` signal.

**Parameters**

| Name        | Type         | Description                     |
| :---------- | :----------- | :------------------------------ |
| `mod`       | [`Mod`](Mod) | The mod to grant.               |
| `mod_owner` | `Object`     | The object to grant the mod to. |

**Returns**

`void`

***

### grant_all

```gdscript
func grant_all(mod_owner: Object) -> void
```

Grants all possible mods to an object.

This method grants all possible mods to the specified mod_owner object and emits the `mod_granted` signal for each granted mod.

**Parameters**

| Name        | Type     | Description                      |
| :---------- | :------- | :------------------------------- |
| `mod_owner` | `Object` | The object to grant the mods to. |

**Returns**

`void`

***

### revoke

```gdscript
func revoke(mod: Mod, mod_owner: Object) -> void
```

Revokes a mod from an object.

This method revokes the specified mod from the specified mod_owner object and emits the `mod_revoked` signal.

**Parameters**

| Name        | Type         | Description                        |
| :---------- | :----------- | :--------------------------------- |
| `mod`       | [`Mod`](Mod) | The mod to revoke.                 |
| `mod_owner` | `Object`     | The object to revoke the mod from. |

**Returns**

`void`

***

### revoke_all

```gdscript
func revoke_all(mod_owner: Object) -> void
```

Revokes all possible mods from an object.

This method revokes all possible mods from the specified mod_owner object and emits the `mod_revoked` signal for each revoked mod.

**Parameters**

| Name        | Type     | Description                         |
| :---------- | :------- | :---------------------------------- |
| `mod_owner` | `Object` | The object to revoke the mods from. |

**Returns**

`void`

***

### get_grantable_mods

```gdscript
func get_grantable_mods(mod_owner: Object) -> Array[Mod]
```

Returns an array of all mods that can be granted to the specified object.

This method searches the `installed_mods` array and returns all mods where the `Mod.grantable_owners` property contains the name of the registered class of the `mod_owner` object.

**Parameters**

| Name        | Type     | Description                                |
| :---------- | :------- | :----------------------------------------- |
| `mod_owner` | `Object` | The object to retrieve grantable mods for. |

**Returns**

| Type                  | Description                 |
| :-------------------- | :-------------------------- |
| `Array`[[`Mod`](Mod)] | An array of grantable mods. |

***

### get_mod_by_id

```gdscript
func get_mod_by_id(id: String) -> Mod
```

Retrieves a mod by its ID.

This method searches the `installed_mods` array and returns the mod with the matching ID.

**Parameters**

| Name | Type     | Description                    |
| :--- | :------- | :----------------------------- |
| `id` | `String` | The ID of the mod to retrieve. |

**Returns**

| Type         | Description                    |
| :----------- | :----------------------------- |
| [`Mod`](Mod) | The mod with the specified ID. |