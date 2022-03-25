#!/usr/bin/env bash

_DIR=$(cd "$(dirname "$0")"; pwd)

cd $_DIR

set -ex

npm run prepare
npx babel --plugins @babel/plugin-transform-modules-commonjs lib/index.js > lib/index.cjs

version=$(cat package.json|jq -r '.version')

add(){
git add -u
git commit -m v$version || true
}

add

git pull

npm set unsafe-perm true
npm version patch
add
git push
npm publish --access=public
