#!/bin/bash

set -e

HOOK=".git/hooks/commit-msg"

cat > "$HOOK" <<'EOF'
#!/bin/bash

ROOT="$(git rev-parse --show-toplevel)"

"$ROOT/git-hooks/conventional-commit.sh" "$1"
EOF

chmod +x "$HOOK"

echo "✅ Conventional Commit hook installed."