# Add a package to the project

mkdir packages/package1
cd packages/package1

# initialize it as an npm package
npm init -y

# change package name to @4iiz/package1 so we can publish it to our private repository
jq '.name = "@4iiz/package1"' package.json > tmp.$$.json && mv tmp.$$.json package.json

# create the entry point (application)
echo "console.log('hello world!');" > index.js

# bootstrap packages so Lerna knows about them and can manage their dependencies:
# 1. npm installs all external dependencies of each package.
# 2. Symlinks together all Lerna packages that are dependencies of each other.
# 3. does "npm run prepublish" in all bootstrapped packages (unless --ignore-prepublish is passed).
# 4. does "npm run prepare" in all bootstrapped packages.
lerna bootstrap

