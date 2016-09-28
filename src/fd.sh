#!/bin/bash

fd::cd(){
    target=$(cat $FD_LIST | peco)
    if [ "$target" ]; then
        cd $target
    else
        return 2
    fi
}

fd::add(){
    if grep -qx $PWD $FD_LIST; then
        echo 'fd:Duplicated entry. Abort.' 1>&2
        return 1
    fi
    pwd >> $FD_LIST
}

fd::edit(){
    vi $FD_LIST
}

fd::list(){
    cat $FD_LIST
}

fd::usage(){
    echo 'fd - Favorite directory using peco'
    echo 'https://github.com/acro5piano/fd'
    echo ''
    echo 'Available subcommands:'
    echo '    add      add the current directory to your favorite directory list.'
    echo '    edit     edit your favorite directory list.'
    echo '    list     show your favorite directory list.'
    echo '    help     show this help.'
    echo ''
    [ "$1" ] && echo "Bad command: $1"
    return 3
}

FD_LIST="$HOME/.fd_list"
[ -e $FD_LIST ] || echo $HOME >> $FD_LIST

case $1 in
    '0') fd::cd ;;
    'a') fd::add ;;
    'add') fd::add ;;
    'e') fd::edit ;;
    'edit') fd::edit ;;
    'l') fd::list ;;
    'list') fd::list ;;
    'h') fd::usage ;;
    'help') fd::usage ;;
    *) fd::usage $1;;
esac

