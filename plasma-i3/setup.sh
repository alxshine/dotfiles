#!/bin/bash

TARGET=~/.config/systemd/user
mkdir -p $TARGET
cp ./plasma-i3.service $TARGET

systemctl --user mask plasma-kwin_x11.service
systemctl --user enable plasma-i3.service
