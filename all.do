#!/bin/sh -ex

export REDO_STDOUT=1

umask 022

ls p | while read x; do
	redo -f "p/$x/index.html"
done
