# Mod

[**See the code at `mod.gd`**](https://github.com/audse/mod-system/tree/main/addons/mod_system/resources/mod.gd)

## Description

**Inherits `Resource`**

The `Mod` class represents a mod in ModSystem. It extends the `Resource` class and provides metadata, assets, and functionality for granting and revoking the mod to/from game objects.

***

## Signals

### installed

```gdscript
signal installed
```

This signal is emitted when the mod is installed with ModSystem.

***

### uninstalled

```gdscript
signal uninstalled
```

This signal is emitted when the mod is uninstalled from ModSystem.

***

### enabled

```gdscript
signal enabled
```

This signal is emitted when the mod is enabled.

***

### disabled

```gdscript
signal disabled
```

This signal is emitted when the mod is disabled.

***

### granted

```gdscript
signal granted(instance: ModInstance)
```

This signal is emitted when the mod is granted to an object.

**Parameters**

| Name       | Type                         | Description               |
| :--------- | :--------------------------- | :------------------------ |
| `instance` | [`ModInstance`](ModInstance) | The granted mod instance. |

***

### revoked
```gdscript
signal revoked(instance: ModInstance)
```

This signal is emitted when the mod is revoked from an object.

**Parameters**

| Name       | Type                         | Description               |
| :--------- | :--------------------------- | :------------------------ |
| `instance` | [`ModInstance`](ModInstance) | The revoked mod instance. |

***

## Properties

### requires_restart
```gdscript
var requires_restart: bool
```

A flag indicating whether the mod requires a game restart to take effect.

**Type**

`bool`

***

### is_cheat
```gdscript
var is_cheat: bool
```

A flag indicating whether the mod provides cheats or cheat-like functionality.

**Type**

`bool`

***

### grantable_owners
```gdscript
var grantable_owners: PackedStringArray
```

An array of registered class names that can receive this mod.

**Type**

`PackedStringArray`

***

### instance_script
```gdscript
var instance_script: ModScript
```

The script to be run when the mod is granted to an object.

**Type**

[`ModScript`](ModScript)

***

### assets
```gdscript
var assets: Array[ModAsset]
```

An array of mod assets associated with the mod.

**Type**

`Array`[[`ModAsset`](ModAsset)]

***

### name
```gdscript
var name: String
```

The name of the mod.

**Type**

`String`

***

### author
```gdscript
var author: String
```

The author of the mod.

**Type**

`String`

***

### version
```gdscript
var version: String
```

The version of the mod.

**Type**

`String`

***

### url
```gdscript
var url: String
```

The URL where the mod can be downloaded or accessed.

**Type**

`String`

***

### thumbnail
```gdscript
var thumbnail: Texture2D
```

A thumbnail image representing the mod.

**Type**

`Texture2D`

***

### instances
```gdscript
var instances: Dictionary[Object, ModInstance]
```

A dictionary that maps objects to their corresponding mod instances.

**Type**

`Dictionary`[`Object`, [`ModInstance`](ModInstance)]

***

### is_enabled
```gdscript
var is_enabled: bool # computed
```

A computed property indicating whether the mod is currently enabled.

**Type**

`bool`

***

## Methods

### grant
```gdscript
func grant(owner: Object) -> void
```

Grants the mod to the specified object. This method creates a mod instance for the specified object and emits the [`granted`](#granted) signal

**Parameters**

| Name    | Type     | Description                     |
| :------ | :------- | :------------------------------ |
| `owner` | `Object` | The object to grant the mod to. |

**Returns** 

`void`

***

### revoke
```gdscript
func revoke(owner: Object) -> void
```

Revokes the mod from the specified object. This method removes the mod instance associated with the specified object and emits the [`revoked`](#revoked) signal.

**Parameters**

| Name    | Type     | Description                        |
| :------ | :------- | :--------------------------------- |
| `owner` | `Object` | The object to revoke the mod from. |

**Returns** 

`void`

***

### get_instance
```gdscript
func get_instance(owner: Object) -> ModInstance
```

Retrieves the mod instance associated with the specified object. If no instance exists, it returns `null`.

**Parameters**

| Name    | Type     | Description                                  |
| :------ | :------- | :------------------------------------------- |
| `owner` | `Object` | The object to retrieve the mod instance for. |


**Returns** 

| Type                         | Description                                                                   |
| :--------------------------- | :---------------------------------------------------------------------------- |
| [`ModInstance`](ModInstance) | The mod instance associated with the object, or `null` if no instance exists. |

***

### get_asset
```gdscript
func get_asset(key: String) -> ModAsset
```

Retrieves a mod asset by its key. This method searches the [`assets`](#assets) array and returns the mod asset with the matching key. If no asset is found, it returns `null`.

**Parameters**

| Name  | Type     | Description                       |
| :---- | :------- | :-------------------------------- |
| `key` | `String` | The key of the asset to retrieve. |

**Returns** 

[`ModAsset`](ModAsset) - The mod asset with the specified key, or `null` if not found.

***

### _on_installed
```gdscript
func _on_installed() -> void
```

This method is called when the mod is installed with ModSystem.

**Note:** This method is intended to be overridden by subclasses to perform additional actions when the mod is installed.

**Returns**

`void`

***

### _on_uninstalled
```gdscript
func _on_uninstalled() -> void
```

This method is called when the mod is uninstalled from ModSystem.

**Note:** This method is intended to be overridden by subclasses to perform additional actions when the mod is uninstalled.

**Returns**

`void`

***

### _on_enabled
```gdscript
func _on_enabled() -> void
```

This method is called when the mod is enabled. 

**Note:** This method is intended to be overridden by subclasses to perform additional actions when the mod is enabled.

**Returns** 

`void`

***

### _on_disabled
```gdscript
func _on_disabled() -> void
```

This method is called when the mod is disabled. 

**Note:** This method is intended to be overridden by subclasses to perform additional actions when the mod is disabled.

**Returns** 

`void`

***

### get_identifier
```gdscript
func get_identifier() -> String
```

Retrieves the unique identifier of the mod. This method returns a unique identifier for the mod, which can be used to differentiate it from other mods.

**Returns** 

`String` - The mod's unique identifier.
