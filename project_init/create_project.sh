#!/usr/bin/env zsh

# Check if the project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <insert project name>"
  exit 1
fi

# Set variables
PROJECT_NAME="$1"
GITHUB_USERNAME="OWU-4f5755"

target_directory=""
while [ -z "$target_directory" ]; do
  echo "Enter the target directory or press 'q' to quit: "
  read target_directory
  if [ "$target_directory" = "q" ]; then
    exit 1
  elif [ -z "$target_directory" ]; then
    echo "Please enter a valid target directory."
  else
    target_directory="${target_directory/#\~/$HOME}"
  fi
done

project_path="$target_directory/$PROJECT_NAME"

# Create project directory and navigate to it
mkdir -p "$project_path"
cd "$project_path"

# Initialize a local Git repository
git init

# Create a .gitignore file
echo "__pycache__/
*.pyc
*.pyo
*.egg-info/
dist/
build/
*.code-workspace
.conda/
*.zshrc*
venv/
*.vscode/
*.DS_Store
*.log" > .gitignore

# Create a README.md file
echo "# $PROJECT_NAME" > README.md

# Initialize conda
source ~/start_miniconda.sh

# Create and export conda environment
conda create --name $PROJECT_NAME --clone torch_clone-py3.9
conda activate $PROJECT_NAME || { echo "conda cannot activate this environment: $PROJECT_NAME"; exit 1; }
conda env export > conda_env.yml

# Create custom .zshrc file
cp ~/.zshrc .zshrc-$PROJECT_NAME
echo -e "\nconda activate $PROJECT_NAME" >> .zshrc-$PROJECT_NAME

# Create .code-workspace file
cat > "$PROJECT_NAME.code-workspace" << EOL
{
  "folders": [
    {
      "path": "."
    }
  ],
  "settings": {
    "terminal.integrated.profiles.zsh": {
      "Custom ZSH": {
        "path": "zsh",
        "args": ["--init-file", "$(pwd)/.zshrc-$PROJECT_NAME"]
      }
    },
    "terminal.integrated.defaultProfile.zsh": "Custom ZSH"
  }
}
EOL

# Commit the initial project files to the local Git repository
git add .gitignore
git commit -m "Initial commit: .gitignore"

# Create a remote GitHub repository
gh repo create --public --confirm "$PROJECT_NAME"
# gh repo create "$PROJECT_NAME" --public --confirm --source=.
# could possibly use to skip next 2 steps:
# gh repo create "$PROJECT_NAME" --public --confirm --source=. --remote=upstream

# Connect the local Git repository to the remote GitHub repository
git remote add origin "https://github.com/$GITHUB_USERNAME/$PROJECT_NAME.git"

# Push the initial commit to the remote GitHub repository
git push -u origin main

# Open the project workspace in VS Code
code "$PROJECT_NAME".code-workspace

# Push the rest of the files to the remote GitHub repository
