#!/bin/bash

DIR=$(dirname $0)
XMDIR=$HOME/.xmonad

if [ -f $XMDIR/xmonad.hs ]
then
    echo "Copy xmonad.hs and backup current xmonad.hs? [y/n]"
    read ANS
    if [[ $ANS == 'y' || $ANS == 'Y' ]]
    then
        echo "Backing up xmonad.hs to xmonad.bak"
        mv -v $XMDIR/xmonad.hs $XMDIR/xmonad.bak
        cp -v $DIR/xmonad.hs $XMDIR
        xmonad --recompile
    fi
fi
