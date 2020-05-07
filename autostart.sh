#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

pkill redshift
pkill polychromatic-tray-applet
pkill conky
killall xautolock
killall xidlehook
pkill '/opt/piavpn/bin/pia-client'

sleep 1

run "compton"
run "/usr/bin/redshift"
run "nm-applet"
run "/usr/bin/libinput-gestures"
run "/home/msjche/.local/bin/locker"
#run "/usr/bin/polychromatic-tray-applet"

