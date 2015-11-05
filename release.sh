#!/bin/bash

if [[ $# != 1 ]]; then echo "$0 <major|minor>"; exit 1; fi

part=$1

echo "Bumping ${part} part of the version"

version=$(bumpversion --dry-run --list ${part} | grep new_version | sed s,"new_version=",,)

git flow release start ${version}
bumpversion ${part}
git flow release finish -m "Version ${version}" -p ${version}
