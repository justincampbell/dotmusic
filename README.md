# dotmusic [![Build Status](https://travis-ci.org/justincampbell/dotmusic.svg?branch=master)](https://travis-ci.org/justincampbell/dotmusic)

# Installation

## [Homebrew](http://brew.sh)

    brew tap justincampbell/formulae
    brew install dotmusic

## Package

    wget -O dotmusic-latest.tar.gz https://github.com/justincampbell/dotmusic/archive/latest.tar.gz dotmusic
    tar -zxvf dotmusic-latest.tar.gz
    cd dotmusic-latest/
    make install

# Usage

Just run `dotmusic`, and the `.music` file in your project root will be appended with the current iTunes artist, if it doesn't already exist.

Add this to your `$PROMPT_COMMAND` for the best experience.
