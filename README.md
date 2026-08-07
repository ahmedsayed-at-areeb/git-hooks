# Git Hooks

A simple Git hooks project for enforcing **Conventional Commits** across repositories.

The hooks are shared using a **Git submodule**, so the same hook implementation can be used by multiple projects.

## Installation

From the root of an existing Git repository:

```bash
curl -fsSL https://raw.githubusercontent.com/ahmedsayed-at-areeb/git-hooks/main/setup.sh -o setup.sh
chmod +x setup.sh
./setup.sh
```

The setup script:

1. Adds this repository as a submodule.
2. Initializes the submodule.
3. Installs the Git hook.

## Structure

After installation:

```text
my-project/
├── .git/
├── .gitmodules
├── .git-hooks/
│   ├── install.sh
│   ├── uninstall.sh
│   ├── conventional-commit.sh
│   └── README.md
└── ...
```

## How It Works

The `git-hooks` repository is added to the project as a submodule:

```bash
git submodule add \
    https://github.com/ahmedsayed-at-areeb/git-hooks.git \
    .git-hooks
```

The submodule is then initialized:

```bash
git submodule update --init
```

Finally, the installation script is executed:

```bash
bash .git-hooks/install.sh
```

The installation script configures the Git hook in the project's `.git/hooks` directory.

## Conventional Commit Hook

The current hook validates commit messages using the **Conventional Commits** format:

```text
<type>(<optional scope>): <description>
```

### Valid

```text
feat: add authentication
```

```text
fix: resolve database connection issue
```

```text
docs: update README
```

### Invalid

```text
add authentication
```

```text
fixed bug
```

```text
Update README
```

Invalid commit messages are rejected by the hook.

## Clone a Repository Using the Submodule

When cloning a repository that contains the submodule:

```bash
git clone --recurse-submodules <repository-url>
```

If the repository was already cloned:

```bash
git submodule update --init
```

Then install the hook:

```bash
bash .git-hooks/install.sh
```

## Updating the Submodule

When the `git-hooks` repository is updated, the project can update its submodule:

```bash
git submodule update --remote
```

Then commit the new submodule reference:

```bash
git add .git-hooks
git commit -m "chore: update git-hooks submodule"
```

## Uninstall

To remove the installed hook:

```bash
bash .git-hooks/uninstall.sh
```
