#!/bin/bash

# Create rclone.conf file from base64
if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config in BASE64 Format detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p $HOME/.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> $HOME/.config/rclone/rclone.conf
fi

# fetch rclone.conf from url

if [[ -n $RCLONE_CONFIG_URL ]]; then
	echo "Rclone config file url detected. Fetching rclone.conf . . ."
	mkdir -p $HOME/.config/rclone
    curl -o$HOME/.config/rclone/rclone.conf "$RCLONE_CONFIG_URL"

fi

# Set $HOME/.config/rclone/rclone.conf as rclone config paths
rclone config --config="$HOME/.config/rclone/rclone.conf" 
echo " Rclone Config Files is located at $HOME/.config/rclone/rclone.conf "

# Set bot token & owner ID

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	cd TelegramShellBot-Rclone
        python3 config.py
fi

echo "SETUP COMPLETED"

# start bot
echo "starting the bot"
npm start
