#!/bin/bash

#unlink spidermonkey to ensure we have the correct js lib

brew unlink spidermonkey

cd couchdbx-core

./cleandist.sh

# temp - clean out to rebuild. TODO - make it work without rebuilding.
rm .*-installed
rm .*-downloaded
rm -rf dist
rm -rf src/erlang_r13B03
rm -rf src/js

./couchdbx-core-builder.sh

scp CouchDBX*.app.zip dh:couch.lstoll.net/nightly/downloads

cd ..

brew link spidermonkey
