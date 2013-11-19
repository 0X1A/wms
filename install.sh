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

cp $DIR/.conkyrc ~/
cp $DIR/sc $XMDIR
cp -r $DIR/dzen2 $XMDIR
cp -r $DIR/scripts $XMDIR

SetNetwork() {
    echo "Please enter your network device name:"
    read NET
    sed -i -e "s/wlan0/$NET/g" $XMDIR/scripts/*.sh
}

SetNetwork

SetUserDir() {
    sed -i -e "s/username/$USER/g" $XMDIR/scripts/*.sh
    sed -i -e "s/username/$USER/g" ~/.conkyrc
}

SetUserDir
