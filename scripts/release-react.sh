#!/bin/bash

if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

set -e

cd packages
cd graphql-playground-react

yarn install
echo "Releasing graphql-playground-react..."
yarn version --no-git-tag-version --new-version patch
yarn publish --non-interactive
export version=$(cat package.json | jq -r '.version')

cd ..
cd ..
