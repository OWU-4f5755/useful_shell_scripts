# Project_Init - A script to initialize a new project

This is a shell script that creates a new project directory with some initial files and configurations.

- >> checks if a project name (`useful_shell_scripts`) is provided as an argument. If not, it prints a usage message and exits.
- >> prompts the user to enter a target directory (`~/repos/`) for the project. If the user enters "q", it'll exit. Otherwise, it sets the target directory as the user input with the tilde expanded to the home directory.
- >> creates a new directory with the project name in the target directory and navigates to it.
- >> initializes a new Git repository in the project directory.
- >> creates a .gitignore file with some common patterns to ignore.
- >> creates a README.md file with the project name as the title.
- >> initializes a new conda environment with the same name as the project and exports it to a conda_env.yml file.
- >> creates a custom .zshrc file for the project that activates the conda environment.
- >> creates a .code-workspace file for the project that sets up a custom ZSH terminal profile and opens the project in VS Code.
- >> commits the initial project files to the local Git repository.
- >> creates a new public GitHub repository with the same name as the project.
- >> connects the local Git repository to the remote GitHub repository.
- >> pushes the initial commit to the remote GitHub repository.
