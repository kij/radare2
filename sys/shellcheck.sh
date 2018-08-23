#!/bin/sh


checkshellscript() {
	filelist="$1"
	checkfun="$2"

	while read -r file 
	do
		$checkfun "$file"	
	done < "$filelist"
		
}

FMT=gcc
#if [ -n "${SHELLCHECK_XML}" ]; then
#	FMT=checkstyle
#fi

SHCHK="shellcheck --format=${FMT}"

if ! [ -f "./sys/known_scripts" ] ;
	echo "Find all shellscripts"
	find .  -not -iwholename '*.git*'  | xargs file | grep "POSIX shell script" | cut -d: -f1  > known_scripts
fi

checkshellscript "./sys/known_scripts" "$SHCHK"



 
