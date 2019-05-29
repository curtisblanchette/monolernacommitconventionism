#!/bin/bash

# Pre-requisite "brew install jq" or "sudo apt-get jq"
# jq is a bash json manipulation command line tool

# we want to ensure "lerna publish" follows a conventional commit structure.
# without defining conventionalCommits: true...
# Lerna won't publish the package because the message doesn't follow convention,
# so we can explicitly define a commit message that follows our convention

# 1. setup lerna to read conventional commits
# 2. assign the conventional-commits strategy to the publish command
# 3. explicitly define the publish commit message
# 4. ensure new versions created by lerna are pushed to the git repository

# Resources:
#   - https://github.com/lerna/lerna/tree/master/core/conventional-commits
#   - https://www.conventionalcommits.org/en/v1.0.0-beta.4/
#   - https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines


# modify lerna.json to include my personal configurations
jq '. + { "command": { "publish": { "conventionalCommits": true, "message": "chore(release): release" }, "version": { "push": true } } }' \
lerna.json > tmp.$$.json && mv tmp.$$.json lerna.json

# echo the output
json_str=`jq '.' lerna.json`
echo "lerna.json"
echo ""
echo "${json_str}"
