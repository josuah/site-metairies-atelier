#!/bin/sh -ex

f=$PWD/index.txt

cd ../..
bin/page.lua "$f"
