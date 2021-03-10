#!/bin/sh -ex

adb reboot sideload-auto-reboot
sleep 20s
adb sideload signed-ota_update.zip
