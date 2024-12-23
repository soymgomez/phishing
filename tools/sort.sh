#!/usr/bin/env bash

## This script should be placed in pre-commit-hooks
set -e
GIT_DIR="$(git rev-parse --show-toplevel)"

if [ -d "$GIT_DIR" ]; then
    cd "${GIT_DIR}" || exit 1

    HIERARCHICALLY=(
        "add-domain" # Sorting hierarchically do to sub-domains
        "falsepositive.list"
        "falsepositive_regex.list"
        "falsepositive_rzd.list"
        "falsepositive_all.list"
        )

    for (( h=0; h<${#HIERARCHICALLY[@]}; h++ )); do
        python3 "$GIT_DIR/tools/domain-sort.py" <"${HIERARCHICALLY[$h]}" \
            >"${HIERARCHICALLY[$h]}.tmp" && \
            sed "/^$/d" "${HIERARCHICALLY[$h]}.tmp" \
            >"${HIERARCHICALLY[$h]}"
            
        echo "Sorting: ${HIERARCHICALLY[$h]}"
    done

    ALPHABETICALLY=(
        "add-wildcard-domain"
        "add-link"
        "IP-addr.cidr.in-addr.arpa"
        "IP-addr.cidr.list"
        "IP-addr.in-addr.arpa"
        "IP-addr.list"
        )

    for (( a=0; a<${#ALPHABETICALLY[@]}; a++ )); do
        sort -u --parallel="$(nproc --ignore=1)" "${ALPHABETICALLY[$a]}" \
            -o "${ALPHABETICALLY[$a]}"
        sed -i "/^$/d" "${ALPHABETICALLY[$a]}"
        echo "Sorting: ${ALPHABETICALLY[$a]}"
        done

    # Remove all *.tmp files in root folder
    find . -maxdepth 1 -mindepth 1 -type f -iname '*.tmp' -delete

fi
