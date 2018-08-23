#!/bin/sh

FMT=gcc
if [ -n "${SHELLCHECK_XML}" ]; then
	FMT=checkstyle
fi

SHCHK="shellcheck --format=${FMT}"

find .  -not -iwholename '*.git*'  | xargs file | grep "POSIX shell script" --line-buffered  | cut -d: -f1 | while read -r file; do ${SHCHK} "$file"; done


