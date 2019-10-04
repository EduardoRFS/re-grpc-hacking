#!/bin/bash
FILE="gRPCBin.exe"
BIN=$(esy echo '#{self.target_dir}/default/bin')

clear
$BIN/$FILE

inotifywait -q -e close_write -m $BIN | grep --line-buffered $FILE | while read -r directory event filename; do
  clear
  $BIN/$FILE
done