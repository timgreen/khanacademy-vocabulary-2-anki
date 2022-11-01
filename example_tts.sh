#!/bin/bash

# Example TTS_SCRIPT that it using https://pypi.org/project/google-speech.

# Due to https://github.com/reuseman/flashcards-obsidian/issues/160#issue-1430804917,
# the audio files need to be in the same directory of markdown file.
# output_dir=tts
# mkdir -p "$output_dir"
file="$(echo "$1.mp3" | sed -e 's/[^A-Za-z0-9._-]/_/g')"
[ -f "$file" ] || google_speech -l en "$1" -o "$file" >&2 && echo "$file"
