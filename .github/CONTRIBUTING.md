# CONTRIBUTING

## General
- The main goal of openning to the community was to **add more features** supported for this project.
- Take a look at the **project structure** and make sure you fully understand it.
- Take a look at **ISSUE** and **PULL REQUEST** templates before openning issues and PR's.
- Be careful about **breaking changes**!!!

## Overview
- `./install.sh` file is used to install **MEOU** and should be refactored if some new feature demands to.
- `./txt/` folder holds **commons text files**.
- `./bin/main.sh` file is the **main script** and just have the main function along with the **dependences imports**.
- `./bin/helpers.sh` file contains **helper functions** to support all others scripts of the this project.
- `./bin/dev.sh` file contains **development functions** to install and configure related stuffs.
- `./bin/multimedia.sh` file contains **multimedia functions** to install and configure related stuffs.

## How to add a new feature?
- Check if it already does not exists.
- Refactor `./install.sh` if the new feature demands to.
- Refactor `./bin/main.sh` to add a new item into case statement.
- Refactor `./bin/<related>.sh` script or create a new one following the pattern used on the others features.
- Update `./README.md` with the new features' stuffs like [BLOCK], [OPTION] and [TAG] that should be passed through command line.
