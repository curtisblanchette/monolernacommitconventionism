#!/bin/bash

# husky provides the ability to add a commit hook for this project
npm i husky -D

# install commitlint so we can lint our commit messages as they are caught by the hook
npm i @commitlint/cli -D

# install @commitlint/config-conventional so we can define the convention we are linting for
npm i @commitlint/config-conventional -D

# add the required Husky configurations to our parent package.json
jq '. + { "husky": { "hooks": { "commit-msg": "commitlint -E HUSKY_GIT_PARAMS" } } }' \
    package.json > tmp.$$.json && mv tmp.$$.json package.json

# add the required Commitlint configurations to our parent package.json
jq '. + { "commitlint": { "extends": [ "@commitlint/config-conventional" ] } }' \
    package.json > tmp.$$.json && mv tmp.$$.json package.json

# clean up
rm -rf tmp.*
