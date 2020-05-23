#!/bin/sh
cd ./codelabs && \
sh export.sh && \
cd .. && \
./node_modules/.bin/gulp serve --codelabs-dir=codelabs