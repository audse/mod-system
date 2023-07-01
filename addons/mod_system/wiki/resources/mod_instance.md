# ModInstance

The `ModInstance` class represents an instance of a mod granted to an object in the Mod System. It contains references to the mod, the object it is granted to, and the instance script associated with the mod.

## Properties

### mod: Mod

- **Description**: The mod associated with this instance.
- **Type**: Mod

### owner: Object

- **Description**: The object to which the mod is granted.
- **Type**: Object

### instance_script: ModInstanceScript

- **Description**: The script to be run when the mod is granted to the object.
- **Type**: ModInstanceScript

## Methods

### grant() -> void

- **Description**: Grants the mod to the associated object.
- **Returns**: void
- **Note**: This method executes the instance script and performs any necessary setup or modifications on the associated object.

### revoke() -> void

- **Description**: Revokes the mod from the associated object.
- **Returns**: void
- **Note**: This method reverts any changes made by the instance script and removes any modifications or effects applied to the associated object.
