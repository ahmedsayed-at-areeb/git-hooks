#!/bin/bash

set -e

REPO_URL="https://github.com/ahmedsayed-at-areeb/git-hooks.git"
SUBMODULE_PATH="git-hooks"

echo "Adding git-hooks..."

if [ ! -d ".git" ]; then
    echo "Error: This directory is not a Git repository."
    exit 1
fi

if git config --file .gitmodules --get "submodule.$SUBMODULE_PATH.url" >/dev/null 2>&1; then
    echo "git-hooks submodule already exists."
else
    git submodule add "$REPO_URL" "$SUBMODULE_PATH"
fi

git submodule update --init --recursive

bash "$SUBMODULE_PATH/install.sh"

echo "Git hooks installed successfully."