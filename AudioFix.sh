#!/bin/bash

echo "
************************************************************************************
                                                  
         Based on Optimzate Script by xiaoM, https://github.com/xiaoMGitHub
                                                                                  
************************************************************************************
"

DAEMON_PATH=/Library/LaunchDaemons/
BIN_PATH=/usr/local/bin/
TMP_PATH=/tmp/
ALC_DAEMON=good.win.ALCPlugFix
ALC_DAEMON_CONFIG=good.win.ALCPlugFix.plist
ALCPlugFIX_BINARY=ALCPlugFix
ALC_VERB_BINARY=alc-verb
URL=https://raw.githubusercontent.com/chilledHamza/Hackintosh_Legion_Y7000_2018/main/ALCPlugFix/

echo "Downloading required file"
sudo curl -o $TMP_PATH$ALCPlugFIX_BINARY "$ALCPlugFIX_BINARY"
sudo curl -o $TMP_PATH$ALC_VERB_BINARY "$ALC_VERB_BINARY"
sudo curl -o $TMP_PATH$ALC_DAEMON_CONFIG "$ALC_DAEMON_CONFIG"

if [ ! -d "$BIN_PATH" ] ; then
    mkdir $BIN_PATH
fi

echo "Copy file to destination place..."
sudo cp $TMP_PATH$ALC_VERB_BINARY $BIN_PATH
sudo cp $TMP_PATH$ALCPlugFIX_BINARY $BIN_PATH
sudo cp $TMP_PATH$ALC_DAEMON_CONFIG $DAEMON_PATH
sudo rm $TMP_PATH$ALC_VERB_BINARY
sudo rm $TMP_PATH$ALCPlugFIX_BINARY
sudo rm $TMP_PATH$ALC_DAEMON_CONFIG

echo "Chmod ALCPlugFix..."
sudo chmod 755 $BIN_PATH$ALC_VERB_BINARY
sudo chown $USER:admin $BIN_PATH$ALC_VERB_BINARY
sudo chmod 755 $BIN_PATH$ALC_FIX_BINARY
sudo chown $USER:admin $BIN_PATH$ALC_FIX_BINARY
sudo chmod 644 $DAEMON_PATH$ALC_DAEMON_CONFIG
sudo chown root:wheel $DAEMON_PATH$ALC_DAEMON_CONFIG

echo "Load ALCPlugFix..."
if sudo launchctl list | grep --quiet $ALC_DAEMON; then
    echo "Stopping existing ALCPlugFix daemon."
    sudo launchctl unload $DAEMON_PATH$ALC_DAEMON_CONFIG
fi
sudo launchctl load -w $DAEMON_PATH$ALC_DAEMON_CONFIG

echo "Done!"

exit 0
