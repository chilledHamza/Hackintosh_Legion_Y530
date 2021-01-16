#!/bin/bash

echo "
************************************************************************************
                                                  
         Based on Optimzate Script by xiaoM, https://github.com/xiaoMGitHub
                                                                                  
************************************************************************************
"

DAEMON_PATH=/Library/LaunchDaemons/
BIN_PATH=/usr/local/bin/
TMP_PATH=/tmp/
ALC_DAEMON_CONFIG=good.win.ALCPlugFix.plist
ALCPlugFix=ALCPlugFix
ALC_VERB=alc-verb
URL=https://raw.githubusercontent.com/chilledHamza/Hackintosh_Legion_Y7000_2018/main/ALCPlugFix/

echo "Downloading required file"
sudo curl -o $TMP_PATH$ALCPlugFix "$URL$ALCPlugFix"
sudo curl -o $TMP_PATH$ALC_VERB "$URL$ALC_VERB"
sudo curl -o $TMP_PATH$ALC_DAEMON_CONFIG "$URL$ALC_DAEMON_CONFIG"

if [ ! -d "$BIN_PATH" ] ; then
    mkdir $BIN_PATH
fi

echo "Copy file to destination place..."
sudo cp $TMP_PATH$ALC_VERB $BIN_PATH
sudo cp $TMP_PATH$ALCPlugFix $BIN_PATH
sudo cp $TMP_PATH$ALC_DAEMON_CONFIG $DAEMON_PATH
sudo rm $TMP_PATH$ALC_VERB
sudo rm $TMP_PATH$ALCPlugFix
sudo rm $TMP_PATH$ALC_DAEMON_CONFIG

echo "Chmod ALCPlugFix..."
sudo chmod 755 $BIN_PATH$ALC_VERB
sudo chown $USER:admin $BIN_PATH$ALC_VERB
sudo chmod 755 $BIN_PATH$ALCPlugFix
sudo chown $USER:admin $BIN_PATH$ALCPlugFix
sudo chmod 644 $DAEMON_PATH$ALC_DAEMON_CONFIG
sudo chown root:wheel $DAEMON_PATH$ALC_DAEMON_CONFIG

echo "Load ALCPlugFix..."
if sudo launchctl list | grep --quiet good.win.ALCPlugFix; then
    echo "Stopping existing ALCPlugFix daemon."
    sudo launchctl unload $DAEMON_PATH$ALC_DAEMON_CONFIG
fi
sudo launchctl load -w $DAEMON_PATH$ALC_DAEMON_CONFIG

echo "Done!"

exit 0
