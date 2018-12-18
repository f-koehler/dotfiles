#!/bin/bash
set -euf -o pipefail

git clean -dfX
git checkout -- init.el
rm -rf straight
