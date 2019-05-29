#!/bin/sh -e

openssl sha256 "$@" | sed -r 's/[^(]*\(([^)]*)\)= /\1=/' | while IFS='=' read file hash; do

	ext=$(echo "$file" | tr A-Z a-z | sed 's/.*\.//; s/jpeg/jpg/')
	dir=${file%/*}

	printf '\n%s\n' "/img/$hash.$ext" >>$dir/gallery.txt
	mv "$file" "img/$hash.$ext"
done
