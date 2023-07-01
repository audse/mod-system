# Mod System Overview

The Mod System is a plugin for Godot 4 that enables game developers to incorporate modding capabilities into their games. It provides a framework for extending and modifying game functionality by creating and installing mods. This overview will delve into the features of the Mod System plugin, explain the lifecycle of a mod, provide implementation insights from both game developer and modder perspectives, and outline the most important classes involved.

## 1. Features of Mod System Plugin

The Mod System plugin offers several key features for game developers:

- **Mod Loading**: The `ModLoader` class handles the loading of mods from the file system. It scans specified mod directories, identifies mod files (e.g., `.mod.tres` or `.mod.json`), and prepares them for registration.

- **Mod Registration**: The `ModClassDB` class is responsible for registering classes within the system. It tracks mod classes, their scripts, and associated resources. Classes are registered with unique identifiers.

- **Mod Management**: The `ModSystem` class serves as the central hub for managing mods. It provides methods for enabling, disabling, and controlling mod execution. The `ModSettings` class stores user preferences related to mod management.

- **Mod Scripting**: The `ModScript` class extends the native `GDScript` class, allowing automatic class registeration into `ModClassDB`.

- **Resource Sharing**: The `ModAsset` class enables modders to share resources among instances of the same mod. Mod assets provide an organized and accessible way to load and use resources such as textures, sounds, or data files.

## 2. The Lifecycle of a Mod

1. **Mod Loading**: The `ModLoader` scans designated mod directories, identifies mod files, and loads them into memory using the appropriate format (e.g., `.mod.tres` or `.mod.json`).

2. **Mod Registration**: The `ModLoader` communicates with the `ModSystem` and `ModClassDB` which registers the loaded mods and their associated classes, respectively. This step makes the mods available within the game's runtime environment.

3. **Mod Enabling**: The `ModSystem` enables or disables mods based on user preferences stored in the `ModSettings`. Enabled mods are ready for execution.

4. **Mod Granting**: The `ModSystem` grants mods to in-game objects, allowing them to access and modify game functionality as defined by the modder.

5. **Mod Execution**: The `ModInstance` and `ModInstanceScript` classes facilitate the execution of enabled mods. These classes instantiate mod scripts and provide the necessary environment for their execution within the game.

6. **Mod Revoking**: The `ModSystem` can revoke and disable mods, providing a mechanism for controlling the behavior and impact of mods in the game.

## 3. Implementation

### 3a. Implementation from a Game Developer's Perspective

This is just a quick overview on how to implement the Mod System plugin. For more detail, check out the tutorial (COMING SOON).

1. Include the Mod System plugin in your Godot project.

2. Set up the `ModLoader` to scan and load mod files from designated directories during the game's initialization phase by updating your game's `ProjectSettings`.

3. Use the `ModClassDB` to register any class that you want extensible by mods. Ensure that each class has a unique identifier for seamless integration.

4. Implement the `ModSystem` to manage mod enabling, disabling, and granting. Utilize the `ModSettings` resource to store user preferences related to mod management.

5. Use the `ModSystem` to to instantiate and execute enabled mods within the game.

### 3b. Implementation from a Modder's Perspective

This is just a quick overview on how to create a mod. For more detail, check out the tutorial (COMING SOON).

1. Develop your mod functionality using GDScript.

2. Package your mod as a mod file (e.g., `.mod.tres` or `.mod.json`). Ensure that the file adheres to the mod file format requirements.

3. Install your mod file in the designated mod directory specified by the game developer. This directory is scanned by the `ModLoader` during runtime.

4. Test your mod by enabling it in-game and verifying its behavior within the game.

## 4. Overview of the Most Important Classes

Here is a summary of the most important classes within the Mod System plugin:

- **Mod**: Defines a mod's metadata, assets, and behavior.
- **ModLoader**: Handles loading mods from the file system.
- **ModClassDB**: Registers classes to be extensible by mods.
- **ModSystem**: Manages mod enabling, disabling, and granting.
- **ModSettings**: Stores user preferences related to mod management.
- **ModInstanceScript**: Main script to be run when a mod is granted.