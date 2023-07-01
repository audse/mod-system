# ModAsset

The `ModAsset` class extends the `Resource` class in the Godot game engine. It represents an asset associated with a `Mod`, containing a unique identifier (`key`) and a reference to a loaded resource (`asset`). The `ModAsset` is loaded once per associated `Mod`, ensuring that all instances of the mod share the same resource. This approach simplifies asset management by allowing developers to reference assets by their `key` rather than worrying about individual loading or file paths.

## Properties

### key: String

- **Description**: An identifier for the asset, unique to the containing `Mod`.
- **Type**: String
- **Export**: Yes

### asset: Resource

- **Description**: The resource associated with the asset.
- **Type**: Resource
- **Export**: Yes

## Methods

### static create(key_value: String, asset_value: Resource) -> ModAsset

- **Description**: Constructs a new `ModAsset` with the given `key` and `asset`.
- **Parameters**:
  - `key_value` (String): The identifier for the asset.
  - `asset_value` (Resource): The resource associated with the asset.
- **Returns**: ModAsset
- **Note**: This is a static method that can be called directly on the `ModAsset` class. It creates a new `ModAsset` instance, assigns the provided `key` and `asset` to the corresponding properties, and returns the created `ModAsset` object.

### static load_resource(path: String) -> Resource

- **Description**: Returns a resource loaded from the specified `path`, if it exists. Otherwise, returns `null`.
- **Parameters**:
  - `path` (String): The path to the resource file.
- **Returns**: Resource or null
- **Note**: This is a static method that can be called directly on the `ModAsset` class. It checks if a resource exists at the given `path` using the `ResourceLoader` and loads it if available. If the resource does not exist, it returns `null`.

### static load_image(path: String) -> Texture2D

- **Description**: Returns a `Texture2D` containing the image at the specified `path`, if it exists. Otherwise, returns `null`. This method also saves a new `.import.tres` file to improve loading speed for future use.
- **Parameters**:
  - `path` (String): The path to the image file.
- **Returns**: Texture2D or null
- **Note**: This is a static method that can be called directly on the `ModAsset` class. It first attempts to load the image from the project files. If the path is relative to the project (`res://`), the image is loaded using the `load` function. If the image has not been imported yet, it loads the image file using `Image` and creates a new `ImageTexture` from it. The imported resource is saved for future use, and the `Texture2D` is returned. If the image file does not exist, `null` is returned.
