#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

pkill conky

sleep 1

run "conky -c $HOME/.config/awesome/conky/conkyrc.lua"
sleep 1
run "conky -c $HOME/.config/awesome/conky/rings.lua"
