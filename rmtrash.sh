#!/bin/sh
TRASH_DIR=/tmp/

while [[ $1 = -* ]]
do
    shift
done

if [ $# -eq 0 ]
then
    echo "rmtrash usage: $0 file ..."
    exit 1
fi

for file in $@
do
    if [ ! -e $file ]
    then
        echo "$0: $file: No such file or directory"
        exit 1
    fi
done

dst_dir=${TRASH_DIR}trash_$(date +%Y%m%d-%H%M%S)
if [ -e $dst_dir ]; then :
else
    mkdir "$dst_dir"
fi
echo "trash.sh: $@ -> $dst_dir"
mv $@ $dst_dir
