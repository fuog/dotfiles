#!/bin/bash
#
#  This will generate the repos.csv :
#  find . -type d -name .git -print0 | xargs -0 -I {} sh -c 'repo=$(dirname "{}"); rel="${repo#./}"; [ -z "$rel" ] && rel="."; url=$(git -C "$repo" config --get remote.origin.url 2>/dev/null || echo ""); printf "\"%s\",\"%s\"\n" "$rel" "$url"'
#
GIT_DIR="${GIT_DIR:="$HOME/git"}"
REPO_LIST_FILE="${REPO_LIST_FILE:="$GIT_DIR/repos.csv"}"

column -t -s, "$REPO_LIST_FILE" | sed '1 s/ /─/g'