# Project_Init - A script to initialize a new project

This is a shell script that creates a new project directory with some initial files and configurations. Enumerated process below:

1. checks if a project name (`useful_shell_scripts`) is provided as an argument. If not, it prints a usage message and exits.
2. prompts the user to enter a target directory (`~/repos/`) for the project. If the user enters "q", it'll exit. Otherwise, it sets the target directory as the user input with the tilde expanded to the home directory.
3. creates a new directory with the project name in the target directory and navigates to it.
4. initializes a new Git repository in the project directory.
5. creates a .gitignore file with some common patterns to ignore.
6. creates a README.md file with the project name as the title.
7. initializes a new conda environment with the same name as the project and exports it to a conda_env.yml file.
8. creates a custom .zshrc file for the project that activates the conda environment.
9. creates a .code-workspace file for the project that sets up a custom ZSH terminal profile and opens the project in VS Code.
10. commits the initial project files to the local Git repository.
11. creates a new public GitHub repository with the same name as the project.
12. connects the local Git repository to the remote GitHub repository.
13. pushes the initial commit to the remote GitHub repository.
