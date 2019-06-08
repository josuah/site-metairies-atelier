#!/bin/sh -e

for file; do

	ext=$(echo "$file" | tr A-Z a-z | sed 's/.*\.//; s/jpeg/jpg/')
	dir=${file%/*}
	dir=${dir##*/}

	[ ! -f "i/$hash/$ext" ] || continue

	mkdir -p tmp
	imagew -w 800 "$file" tmp/$$.$ext
	hash=$(openssl sha256 "tmp/$$.$ext" | sed 's/.*= //')
	mv "tmp/$$.$ext" "i/$hash.$ext"
	rm "$file"

	mkdir -p "p/$dir"
	printf '\n%s\n' "/i/$hash.$ext" >>p/$dir/index.txt

done
