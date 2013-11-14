#!/bin/bash

XMDIR=$HOME/.xmonad

if [ -f $XMDIR/xmonad.hs ]
then
    echo "Backing up xmonad.hs to xmonad.bak"
    cp $XMDIR/xmonad.hs $XMDIR/xmonad.bak
fi

cp xmonad.hs $XMDIR
