#!/usr/bin/env python3
import os

# Predefined list of documented executables with descriptions
documented_executables = {
    "macos": {
        "move_to_workdir.applescript": "Automate moving select files/dir in Finder to ~work",
        "create_new_file.applescript": "Quickly creates a new file at cursor position in Finder",
        "restart_controlcenter.sh": "Restart the Control Center process to fix visual bug",
    },
    "windows": {},
    "linux": {},
    "generic": {}
}

# Aliases for the scripts
script_aliases = {
    "move_to_workdir.applescript": ["m2work"],
    "create_new_file.applescript": ["cnf"],
    "restart_controlcenter.sh": ["rcc"],
}

# Base directory containing the script subdirectories
base_dir = os.path.dirname(os.path.realpath(__file__))

def is_executable(file_path):
    return os.path.isfile(file_path) and os.access(file_path, os.X_OK)

def list_executables(os_name, scripts_dir):
    print(f"\n{os_name.capitalize()} Executables:\n")
    print("Script Name\tDescription\tAliases")
    for script, description in documented_executables.get(os_name, {}).items():
        script_path = os.path.join(scripts_dir, script)
        if is_executable(script_path):
            aliases = ", ".join(script_aliases.get(script, []))
            print(f"{script}\t{description}\t{aliases}")

    for script in os.listdir(scripts_dir):
        script_path = os.path.join(scripts_dir, script)
        if is_executable(script_path) and script not in documented_executables.get(os_name, {}):
            print(f"{script}\t\t")

# List scripts
for category in ["macos", "windows", "linux", "generic"]:
    dir_path = os.path.join(base_dir, category)
    if os.path.isdir(dir_path):
        list_executables(category, dir_path)
