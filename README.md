# dot-music [![Build Status](https://travis-ci.org/justincampbell/dot-music.svg?branch=master)](https://travis-ci.org/justincampbell/dot-music)

# Installation

## [Homebrew](http://brew.sh)

    brew tap justincampbell/formulae
    brew install dot-music

## Package

    wget -O dot-music-latest.tar.gz https://github.com/justincampbell/dot-music/archive/latest.tar.gz dot-music
    tar -zxvf dot-music-latest.tar.gz
    cd dot-music-latest/
    make install

# Usage

Just run `dot-music`, and the `.music` file in your project root will be appended with the current iTunes artist, if it doesn't already exist.

Add this to your `$PROMPT_COMMAND` for the best experience.
