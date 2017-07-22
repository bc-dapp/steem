#!/bin/bash

repoRoot=$(pwd)

mkdir -p steem-build
cd steem-build
cmake -DLOW_MEMORY_NODE=ON -DBUILD_STEEM_TESTNET=ON -DENABLE_COVERAGE_TESTING=true -DCMAKE_BUILD_TYPE=Debug $repoRoot/steem
make


