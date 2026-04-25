#!/bin/bash

mkdir -p converted

for file in *.{mp4,mkv,avi,mov,mxf,webm}; do
  [ -e "$file" ] || continue
  
  ffmpeg -i "$file" \
    -c:v dnxhd -profile:v dnxhr_hq \
    -c:a pcm_s16le \
    -pix_fmt yuv422p \
    -y \
    "converted/${file%.*}.mov" \
    -loglevel error
  
  echo "Converted: $file"
done