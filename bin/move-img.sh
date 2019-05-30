#!/bin/sh -e

for file; do

	ext=$(echo "$file" | tr A-Z a-z | sed 's/.*\.//; s/jpeg/jpg/')
	dir=${file%/*}
	dir=${dir##*/}

	[ ! -f "img/$hash/$ext" ] || continue

	mkdir -p tmp
	imagew -w 800 "$file" tmp/$$.$ext
	hash=$(openssl sha256 "tmp/$$.$ext" | sed 's/.*= //')
	mv "tmp/$$.$ext" "img/$hash.$ext"
	rm "$file"

	printf '\n%s\n' "/img/$hash.$ext" >>p/$dir/index.txt

done
