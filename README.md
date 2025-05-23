# [Project Template] - 0.0.1

![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

## Software Kit

![Blender](https://img.shields.io/badge/blender-%23F5792A.svg?style=for-the-badge&logo=blender&logoColor=white)
![Godot Engine](https://img.shields.io/badge/GODOT-%23FFFFFF.svg?style=for-the-badge&logo=godot-engine)
![Zed](https://img.shields.io/badge/Zed-white?style=for-the-badge&logo=zedindustries&logoColor=084CCF)
![Vim](https://img.shields.io/badge/VIM-%2311AB00.svg?style=for-the-badge&logo=vim&logoColor=white)
![Audacity](https://img.shields.io/badge/Audacity-0000CC?style=for-the-badge&logo=audacity&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![Krita](https://img.shields.io/badge/Krita-203759?style=for-the-badge&logo=krita&logoColor=EEF37B)
![Aseprite](https://img.shields.io/badge/Aseprite-FFFFFF?style=for-the-badge&logo=Aseprite&logoColor=#7D929E)


## Requirements

### Software

| Name  | Version |                     Link                     |
| :---- | :------ | :------------------------------------------: |
| Godot | 4.4     | [Download](https://godotengine.org/download) |

### Reading

| Source              |                      Link                       |
| :------------------ | :---------------------------------------------: |
| Godot Documentation | [View](https://docs.godotengine.org/en/stable/) |

---

## Utility Scripts

This project includes a few utility scripts. Feel free to delete them if they are not needed. These scripts are:

- PrettyNumbers - A static class used to format numbers.
- SaveManager - A singleton save system.

## UI Holder Pattern

This project includes a top-level UI manager component: UIHolder. Simply use the `UIHolder.add` and `UIHolder.remove` to add and remove Control nodes.
Note: removing a Control node frees it from the scene tree.

When adding a Control node via the UIHolder, a UI layer is required. This can be found and changed in `UIHolder`. Control nodes will be ordered according to this enum, with higher values in the front.

Example: `UIHolder.add(ui, UIHolder.UILayers.WORLD)`.

## Custom Settings
This projects includes a few custom settings added in the Project Settings under the "Blueprint" section:

- Save File Encryption Key: encryption key used to store save data.
- Show FPS Counter: Toggle on to show an FPS counter. Can also be turned on/off in code via `FPSCounter.toggle(bool)`. This is on by default.

## Utility Scripts
This projects includes a few util scripts for linting and formatting. Run them by typing:
- ./lint.sh
- ./format.sh

***Note**: GDScript Toolkit will need to be installed from [here](https://github.com/Scony/godot-gdscript-toolkit).*

## GitHub Actions
Included is a basic linting GitHub action located in `/.github/workflows/lint.yml`. This will automatically lint your code when pushed/PR'd into `main`.

## Folder Structure

```
|-- addons
|-- assets
   |-- editor
   |-- media
   |   |-- audio
   |   |-- video
   |-- sprites
   |-- models
   |-- materials
   |-- shaders
   |   |-- canvas
   |   |-- spatial
   |   |-- particle
   |-- fonts
   |-- scenes
   |   |-- levels
   |   |-- characters
   |   |-- other
   |-- scripts
   |   |-- editor
   |   |-- entities
   |   |-- autoloads
   |   |-- utilities
   |   |-- resources
   |   |-- other
|-- externalAssets
   |-- media
   |   |-- audio
   |   |-- video
   |-- sprites
   |-- models
   |-- materials
   |-- shaders
   |-- fonts
   |-- scripts
```

| Folder            | Description                                                                                                            |
| :---------------- | :--------------------------------------------------------------------------------------------------------------------- |
| addons            | Store all addons/plugins in this folder.                                                                               |
| media             | Store all audio and video files here.                                                                                  |
| sprites           | Store all 2D sprites here.                                                                                             |
| models            | Store all 3D models here.                                                                                              |
| materials         | Store all materials here.                                                                                              |
| shaders           | Store all spatial, canvas or particle shaders here.                                                                    |
| fonts             | Store all font resources here.                                                                                         |
| scenes            | Store all scenes here.                                                                                                 |
| scripts           | Store all scripts here.                                                                                                |
| scripts/editor    | For Editor specific scripts.                                                                                           |
| scripts/autoloads  | For singleton scripts used in Auto Loading.                                                                            |
| scripts/utilities | For utilty scripts used across the project.                                                                            |
| scripts/resources | Instances of DataObjects or other Godot resources.                                                                     |
| external-assets   | This is a reflection of the Assets folder, but meant for external assets you want to keep seperate from your project . |

---

## Conventions

- Use line feed (LF) characters to break lines, not CRLF or CR.
- Use one line feed character at the end of each file.
- Use UTF-8 encoding without a byte order mark.
- Use Tabs instead of spaces for indentation.

See the [Godot Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html) for a full breakdown.

| Name                        | Rule                                                                             | Example                               |
| :-------------------------- | :------------------------------------------------------------------------------- | :------------------------------------ |
| Variables                   | Use snake case. Private variables start with an underscore.                      | `var _private_var: int`               |
| Functions                   | Use snake case. Private functions start with an underscore.                      | `func _private_func():`               |
| Signals                     | Use snake case.                                                                  | `signal my_signal`                    |
| Constants/Enums             | Use upper snake case.                                                            | `var MY_CONST`                        |
| Folders                     | Use kebab case.                                                                  | folder-name-here                      |
| Classes                     | Use pascal case.                                                                 | `class_name MyClass`                  |
| Variable Declaration        | Always use `:` operator to create variables with a type.                         | `var my_variable: string = "my var"`  |
| Function Declaration        | Always use `->` operator to specify function return type.                        | `func do_something(age: int) -> int:` |
| Max Parameters              | A method should not have more than 5 parameters.                                 | -                                     |
| No magic numbers or strings | Do not use magic variables, rather define them as constant in a single location. | -                                     |

---

## Commit Structure

Please follow the Conventional Commits standards as well as squashing your commits into a single commit.

Specification can be found at [www.conventionalcommits.org](https://www.conventionalcommits.org/en).

How to squash commits: [https://www.git-tower.com/learn/git/faq/git-squash](https://www.git-tower.com/learn/git/faq/git-squash)

Commits should be in the following form: **type[optional scope]: description**. Examples include:

> feat: allow provided config object to extend other configs

> feat(api)!: send an email to the customer when a product is shipped

> docs: correct spelling of CHANGELOG

|       Type        | Title                    | Emoji | Release | Description                                                                                                 |
| :---------------: | ------------------------ | :---: | :-----: | ----------------------------------------------------------------------------------------------------------- |
|      `feat`       | Features                 |  ✨   | `minor` | A new feature                                                                                               |
|    `refactor`     | Code Refactoring         |  📦   | `patch` | A code change that neither fixes a bug nor adds a feature                                                   |
|      `perf`       | Performance Improvements |  🚀   | `patch` | A code change that improves performance                                                                     |
|       `fix`       | Bug Fixes                |  🐛   | `patch` | A bug Fix                                                                                                   |
|      `chore`      | Chores                   |  ♻   | `patch` | Other changes that don't modify src or test files                                                           |
|     `revert`      | Reverts                  |  🗑   | `patch` | Reverts a previous commit                                                                                   |
|      `docs`       | Documentation            |  📚   | `patch` | Documentation only changes                                                                                  |
|      `style`      | Styles                   |  💎   |    -    | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)      |
|      `test`       | Tests                    |  🚨   |    -    | Adding missing tests or correcting existing tests                                                           |
|      `build`      | Builds                   |  🛠   | `patch` | Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)         |
|       `ci`        | Continuous Integrations  |  ⚙   |    -    | Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs) |
| `BREAKING CHANGE` | Breaking Change          |  💔   | `major` | When a breaking change occurs on the commit. Rather use the "!" operator in conjunction with a type.        |
