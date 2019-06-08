#!/bin/sh -e

exec find . -name 'index.txt' -exec sh -c '
	exec bin/page.lua "$0" >"${0%.txt}.html"
' {} \;
