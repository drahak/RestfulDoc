#!/bin/bash

BASE_DIR=`dirname $0`

cd $BASE_DIR/../

npm install --safe-dev
bower install --dev