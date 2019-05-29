#!/bin/bash

# 1. initializes a lerna monorepo
# 2. -i signifies "independent mode" allowing all packages to be incremented independently.
# 3. adds Lerna to our devDependencies in package.json

lerna init -i
