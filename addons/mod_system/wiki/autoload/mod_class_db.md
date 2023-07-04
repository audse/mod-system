# ModClassDB

[**See the code at `mod_class_db.gd`**](https://github.com/audse/mod-system/tree/main/addons/mod_system/autoload/mod_class_db.gd)

## Description

**Inherits `Node`**

The `ModClassDB` class is a **singleton** that serves as a database of all classes registered to ModSystem. It provides methods for registering classes, unregistering classes, and querying registered classes. 

This class allows ModSystem to keep track of classes that can be extended, modified, or referenced by mods.

Game developers who want their classes to be modifiable through ModSystem need to ensure that they register their classes with the `ModClassDB` so that mods can interact with them.

***

## Signals

### class_registered

```gdscript
signal class_registered(cls: RegisteredClass)
```

This signal is emitted when a class is registered to `ModClassDB`.

**Parameters**

| Name  | Type                   | Description                |
| :---- | :--------------------- | :------------------------- |
| `cls` | [`RegisteredClass`](#) | The just-registered class. |

***

### class_unregistered

```gdscript
signal class_unregistered(cls: RegisteredClass)
```

This signal is emitted when a class is unregistered from `ModClassDB`.

**Parameters**

| Name  | Type                   | Description                  |
| :---- | :--------------------- | :--------------------------- |
| `cls` | [`RegisteredClass`](#) | The just-unregistered class. |

---

## Properties

### registered_classes

```gdscript
var registered_classes: Array[RegisteredClass]
```

An array that holds the current registered classes.

**Type**

`Array`[[`RegisteredClass`](#)]

---

## Methods

### register

```gdscript
func register(script: GDScript) -> RegisteredClass
```

Registers a class to `ModClassDB`, enabling use in ModSystem.

This method creates a [`RegisteredClass`](#) object for the class and adds it to the [`registered_classes`](#registered_classes) array. The [`class_registered`](#class_registered) signal is emitted after registration.

**Parameters**
| Name     | Type       | Description                                   |
| :------- | :--------- | :-------------------------------------------- |
| `script` | `GDScript` | The GDScript script of the class to register. |

**Returns**
| Type                   | Description                |
| :--------------------- | :------------------------- |
| [`RegisteredClass`](#) | The just-registered class. |

***

### register_with_name

```gdscript
func register_with_name(cls: StringName, script: GDScript) -> RegisteredClass
```

Registers a class to `ModClassDB` with the given name, enabling use in ModSystem.

This method creates a [`RegisteredClass`](#) object for the class and adds it to the [`registered_classes`](#registered_classes) array. The [`class_registered`](#class_registered) signal is emitted after registration.

**Parameters**
| Name     | Type         | Description                                                                  |
| :------- | :----------- | :--------------------------------------------------------------------------- |
| `cls`    | `StringName` | The name to use when registering the class. See [`RegisteredClass.name`](#). |
| `script` | `GDScript`   | The GDScript script of the class to register.                                |

**Returns**
| Type                   | Description                |
| :--------------------- | :------------------------- |
| [`RegisteredClass`](#) | The just-registered class. |

***

### unregister

```gdscript
func unregister(cls: StringName) -> void
```

Unregisters a class from `ModClassDB`, disabling use in ModSystem.

This method removes the corresponding [`RegisteredClass`](#) object from the [`registered_classes`](#registered_classes) array. The [`class_unregistered`](#class_unregistered) signal is emitted after unregistration.

**Parameters**

| Name  | Type         | Description                          |
| :---- | :----------- | :----------------------------------- |
| `cls` | `StringName` | The name of the class to unregister. |

***

### is_class_name_registered

```gdscript
func is_class_name_registered(cls: StringName) -> bool
```

Checks if a class name is registered with `ModClassDB`.

This method searches the [`registered_classes`](#registered_classes) array for a matching class name and returns the result.

**Parameters**
| Name  | Type         | Description                     |
| :---- | :----------- | :------------------------------ |
| `cls` | `StringName` | The name of the class to check. |

**Returns**
| Type   | Description                                               |
| :----- | :-------------------------------------------------------- |
| `bool` | `true` if the class name is registered, `false` otherwise |

***

### is_script_registered

```gdscript
func is_script_registered(cls: Script) -> bool
```

Checks if a script is registered with `ModClassDB`.

This method searches the [`registered_classes`](#registered_classes) array for a matching script and returns the result.

**Parameters**
| Name  | Type     | Description          |
| :---- | :------- | :------------------- |
| `cls` | `Script` | The script to check. |

**Returns**
| Type   | Description                                                 |
| :----- | :---------------------------------------------------------- |
| `bool` | `true` if the script class is registered, `false` otherwise |

***

### get_by_name

```gdscript
func get_by_name(cls: StringName) -> RegisteredClass
```

Retrieves a registered class by its name.

This method searches the [`registered_classes`](#registered_classes) array for a matching class name and returns the corresponding [`RegisteredClass`](#) object.

**Parameters**
| Name  | Type         | Description                        |
| :---- | :----------- | :--------------------------------- |
| `cls` | `StringName` | The name of the class to retrieve. |

**Returns**
| Type                   | Description           |
| :--------------------- | :-------------------- |
| [`RegisteredClass`](#) | The registered class. |

***

### get_by_script

```gdscript
func get_by_script(cls: Script) -> RegisteredClass
```

Retrieves a registered class by its script.

This method searches the [`registered_classes`](#registered_classes) array for a matching script and returns the corresponding [`RegisteredClass`](#) object.

**Parameters**
| Name  | Type     | Description             |
| :---- | :------- | :---------------------- |
| `cls` | `Script` | The script to retrieve. |

**Returns**
| Type                   | Description           |
| :--------------------- | :-------------------- |
| [`RegisteredClass`](#) | The registered class. |
