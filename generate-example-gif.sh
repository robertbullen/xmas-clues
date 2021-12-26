#!/usr/bin/env zsh

# Install dependencies.
brew install --quiet ffmpeg gifsicle

# Reduce the large screen capture recording to a smaller animated GIF.
ffmpeg -i 'doc/example.mov' -pix_fmt 'rgb8' -r '12' -vf scale=288:-1 -y 'doc/example.gif'

# Further optimize the GIF.
gifsicle -O3 'doc/example.gif' -o 'doc/example.gif'
