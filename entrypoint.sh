#!/bin/sh -e

REMOTE_REPO="$1"
API_TOKEN="$2"
SUBMOD_PATH="$3"
REMOTE_BRANCH="${4##*/}"
GITLOG="$5"

HEADER="Authorization: Basic $(echo -n $API_TOKEN | base64)"

git -c http.extraheader="$HEADER" clone $REMOTE_REPO /tmp/remote
cd /tmp/remote
git checkout ${REMOTE_BRANCH}
git submodule init

rm -rf $SUBMOD_PATH
mkdir -p $(dirname SUBMOD_PATH)
cp -r $GITHUB_WORKSPACE $SUBMOD_PATH
git commit -m "Bump $SUBMOD_PATH: $GITLOG" $SUBMOD_PATH

git -c http.extraheader="$HEADER" push $REMOTE_REPO
