#!/bin/sh -e

dest=$1

mkdir -p "$dest"
exec find . -name 'index.txt' -exec sh -c '
	( cat "t/head.html"
	i=0; while read line; do i=$((i+1))
		case "$line" in
		(/i/*) echo "<a href=\"#$i\" id=\"$i\" class="img"><img src=\"$line\"/></a>" ;;
		(/t/*) cat "${line#/}" ;;
		(*) echo "$line" ;;
		esac
	done <"$1"
	cat "t/foot.html" ) >"$0/${1%.txt}.html"
' "$dest" {} \;
