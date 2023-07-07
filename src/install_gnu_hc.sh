#!/usr/bin/env bash

set -ex

cd "$(dirname "$0")"

apt-get update
apt-get install -y python3 python3-pip libcairo2-dev libxt-dev libgirepository1.0-dev python3-gi-cairo
apt-get clean

pip3 install pycairo PyGObject "gnuhealth-client==$GNU_HC_VERSION"

rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
