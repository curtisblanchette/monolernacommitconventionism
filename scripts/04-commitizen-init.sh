#!/bin/bash

# What is Commitizen?
# a global utility that provides an interface to structure
# conventional commit messages on every commit

# you have two options for installation: either install commitizen globally,
# or use NPX to run the tool directly from NPM registry
# and install the adapter that way.

# npm i commitizen -g
#   --or
# npx commitizen init cz-conventional-changelog -D -E
#  --npx allows you to run tools from NPM registry without installing them globally

# this will be the convention our contributors need to follow
# 1. defines which changelog adapter to use for this project
# 2. installs the cz-conventional-changelog adapter npm module
# 3. adds the commitizen configurations to package.json

commitizen init cz-conventional-changelog -D -E

# example commit message format:
# <type>(scope): <subject>

# usage:
# "git cz" rather than "git commit -m 'my message'"
