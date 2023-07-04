# ModLoader

[**See the code at `mod_loader.gd`**](https://github.com/audse/mod-system/tree/main/addons/mod_system/autoload/mod_loader.gd)

## Description

**Inherits `Node`**

The `ModLoader` class is a singleton responsible for loading mods. Upon game start, this class:

1. Recursively searches for mod files (`.mod.tres` or `.mod.json` files) within the directories specified in the `ProjectSettings."mod_system/mod_paths"` property
2. Loads the mods it found
3. Communicates with `ModSystem` to register them using the `ModSystem.register` method.

The `ModLoader` class is designed to work in conjunction with the `ModSystem` class, which manages the overall functionality and behavior of mods in the game.

***

## Signals

### finished_loading

```gdscript
signal finished_loading
```

This signal is emitted when all mods have been loaded and registered.

***

## Properties

### is_finished_loading

```gdscript
var registered_mods: Array[Mod]
```

If `true`, all mods have been loaded and registered.

**Type**

`bool`


***

## Methods

### load_all_mods

```gdscript
func load_all_mods() -> void
```

Recursively finds all mod paths that end with `.mod.tres` or `.mod.json`, loads them, and registers them using the `ModSystem.register` method.

***

### load_mod

```gdscript
func load_mod(path: String) -> Mod
```

Loads a mod at the specified `path` and registers it using the `ModSystem.register` method.

**Parameters**

| Name   | Type     | Description                       |
| ------ | -------- | --------------------------------- |
| `path` | `String` | The file path of the mod to load. |

**Returns**

| Type                   | Description     |
| ---------------------- | --------------- |
| [`Mod`](Mod) or `null` | The loaded mod. |

***

### discover_mod_paths

```gdscript
func discover_mod_paths(dirs: Array[String]) -> Array[String]
```

Recursively searches each listed directory for mods and returns a list of all paths to mods.

**Parameters**

| Name   | Type              | Description                         |
| ------ | ----------------- | ----------------------------------- |
| `dirs` | `Array`[`String`] | The directories to search for mods. |

**Returns**

| Type              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| `Array`[`String`] | Returns all paths to mods within the listed `dirs` (recursively). |
