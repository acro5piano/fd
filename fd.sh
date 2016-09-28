#!/bin/bash

fd::cd(){
    target=$(cat $FABD_LIST | peco)
    if [ "$target" ]; then
        cd $target
    else
        return 2
    fi
}

fd::add(){
    if grep -qx $PWD $FABD_LIST; then
        echo 'fd:Duplicated entry. Abort.' 1>&2
        return 1
    fi
    pwd >> $FABD_LIST
}

fd::edit(){
    vi $FABD_LIST
}

fd::list(){
    cat $FABD_LIST
}

fd::usage(){
    echo 'fd [a|e]'
    echo "Bad command: $1"
    return 3
}

FABD_LIST="$HOME/.fd_list"
[ -e $FABD_LIST ] || echo $HOME >> $FABD_LIST

case $1 in
    '0') fd::cd ;;
    'a') fd::add ;;
    'add') fd::add ;;
    'e') fd::edit ;;
    'edit') fd::edit ;;
    'l') fd::list ;;
    'list') fd::list ;;
    *) fd::usage $1;;
esac

