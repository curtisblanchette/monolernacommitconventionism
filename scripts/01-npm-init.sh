#!/bin/bash

# create an npm package and initialize git

npm init -y

git init

git remote add origin git@github.com:curtisblanchette/monolernacommitconventionism.git

git remote set-url origin git@github.com:curtisblanchette/monolernacommitconventionism.git

# set the parent project to private,
# we never want to publish it or have Lerna add its changes to any package changelogs
jq '.private = true' package.json > tmp.$$.json && mv tmp.$$.json package.json

# create a basic .gitignore
echo -e 'node_modules\n.idea' > .gitignore
