# Mod System 

#### An addon for Godot 4

ModSystem is a plugin for Godot 4 that provides a framework for extending and modifying game functionality through mods.

## Features

- Automatically discover and load installed mods on game start
- Pick which parts of your game you want to be moddable
- Save & load mod-related user preferences
- Modders never have to download the Godot engine - load all assets, scripts, etc. *without* requiring a packaged `.pck` or `.zip` file


## Getting started

### Tutorial

#### For gamedevs

**Coming soon!**

#### For modders

**Coming soon!**

### Documentation

[All classes](addons/mod_system) have documentation comments for all public variables and methods. You can also read the wiki for more thorough documentation.

#### Wiki

1. [Overview](addons/mod_system/wiki/overview.md)
2. [Autoload](addons/mod_system/wiki/autoload) - the singletons created when your game starts
	1. [ModClassDB](addons/mod_system/wiki/autoload/mod_class_db.md) - a database that tracks which classes are extensible by mods
	2. [ModLoader](addons/mod_system/wiki/autoload/mod_loader.md) - responsible for loading and registering mods
	3. [ModSystem](addons/mod_system/wiki/autoload/mod_system.md) - handles management of mods within the game (enabling, disabling, granting, etc.)
3. [Resources](addons/mod_system/wiki/resources) - data and asset classes
	1. [ModAsset](addons/mod_system/wiki/resources/mod_asset.md) - stores a key and asset pair
	2. [ModInstanceScript](addons/mod_system/wiki/resources/mod_instance_script.md) - A script run when granting a mod to an object
	3. [ModInstance](addons/mod_system/wiki/resources/mod_instance.md) - An instance of a mod after it's granted to an in-game object
	4. [ModScript](addons/mod_system/wiki/resources/mod_script.md) - extension of native GDScript class that automatically registers to ModClassDB
	5. [ModSettings](addons/mod_system/wiki/resources/mod_settings.md) - stores user preferences for their installed mods
	6. [Mod](addons/mod_system/wiki/resources/mod.md)
	7. [RegisteredClass](addons/mod_system/wiki/resources/registered_class.md) - represents a class registered in ModClassDB







