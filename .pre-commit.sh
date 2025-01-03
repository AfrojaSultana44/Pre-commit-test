#!/usr/bin/env bash

export PATH="$PATH:$HOME/.composer/vendor/bin"

if ! command -v php-cs-fixer &> /dev/null; then
    echo "php-cs-fixer could not be found"
    echo "It must be installed globally with composer: composer global require friendsofphp/php-cs-fixer"
    echo "Make sure it's in your \$PATH"
    exit 1
fi


pm4dir="$(dirname "$(readlink -f "$0")")"
files=$(git status --porcelain=v2 | grep -E '^\d [AM].*\.php$' | cut -d ' ' -f 9)
errors=()
if [ -n "$files" ]; then
    while read file; do
        echo "Checking $file"
        php-cs-fixer fix --dry-run --verbose "$file" 2> /dev/null
        if [ $? -ne 0 ]; then
            errors+=("$file")
        fi
    done <<< "$files"
fi


if [ ${#errors[@]} -gt 0 ]; then
    echo ""
    echo "php-cs-fixer failed for files: ${errors[@]}"
    echo ""
    echo "You can attempt to fix these automatically by running 'php-cs-fixer fix [file]'"
    echo ""
    exit 1
fi