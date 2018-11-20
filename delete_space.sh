#!/bin/bash
function getdir(){
    for element in `ls $1`
    do
        dir_or_file=$1'/'$element
        if [ -d $dir_or_file ]
        then
            echo $dir_or_file
            getdir $dir_or_file
        else
            if [[ $dir_or_file == *.h || $dir_or_file == *.cpp || $dir_or_file = *.hpp || $dir_or_file = *.c || $dir_or_file = *.txt || $dir_or_file = *.py ]] #|| [ $dir_or_file = *.hpp ] || [ $dir_or_file = *.h ]
            then
                echo $dir_or_file
                sed -i 's/[ \t]*$//g' $dir_or_file
            fi
        fi
    done
}
root_dir="."
getdir $root_dir