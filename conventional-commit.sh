#!/bin/bash

commit_file="$1"

message=$(cat "$commit_file")
header=$(head -n1 "$commit_file")

regex='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([a-zA-Z0-9._/-]+\))?!?: .+'

if ! echo "$header" | grep -Eq "$regex"; then
    echo
    echo "❌ Invalid commit message."
    echo
    echo "Expected:"
    echo "  type(scope): description"
    echo
    echo "Examples:"
    echo "  feat(auth): add JWT validation"
    echo "  fix(api): handle timeout"
    echo "  docs: update README"
    echo "  feat!: remove deprecated API"
    exit 1
fi

if echo "$message" | grep -q "BREAKING CHANGE"; then
    if ! echo "$message" | grep -Eq '^BREAKING CHANGE: .+'; then
        echo
        echo "❌ Invalid BREAKING CHANGE footer."
        exit 1
    fi
fi

exit 0