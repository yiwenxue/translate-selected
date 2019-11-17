#!/bin/bash

green='\033[0;32m'
red='\033[0;35m'
nc='\033[0m'
maxlength=30
minleng=1

while clipnotify 
do
    SelectedText="$(xsel)"
    ModifiedText="$(echo "$SelectedText" | sed -z 's/\.\n/.|/g' \
        | sed -z 's/\n/ /g' | sed -z 's/\.|/.\n/g' )"
    FinalText="$(echo "$ModifiedText" | sed 's/- //g')"
    echo -e "$FinalText \n"
    Translated=$(trans --brief :$1 "$FinalText")
    echo "$Translated"
    echo -e "${red}___________________________________________________________${nc}"
    if [ ${#FinalText} -lt $maxlength ];
    then 
        if [ ${#FinalText} -gt $minleng ];
        then 
            echo -e "$FinalText \t $Translated" >> ~/iSrael/dict.txt
        fi
    fi
done
