#!/bin/bash

extract_content() {
  local html="$(cat)"

  if [[ "$html" =~ \<title\>([^<]+): ]]; then
    echo "${BASH_REMATCH[1]}"
  else
    echo "Failed to extract title" >&2
    exit 1
  fi

  local regex='("perseusContent":"([^"]|\\")+")'
  # unquoted in order for =~ to work
  if [[ "$html" =~ $regex ]]; then
    echo "{ ${BASH_REMATCH[1]} }" \
      | jq -r .perseusContent \
      | jq -r '.[] | .content'
  else
    echo "Failed to extract vocabulary" >&2
    exit 1
  fi
}

convert_to_obsidian_flashcards() {
  IFS= read -r title

  cat << EOH
---
tags: vocabulary
cards-deck: Vocabulary::$title
---

EOH

  while IFS= read -r line; do
    if [[ "$line" =~ ^\*\*Word(:\*\*|\*\*:)\ __(.+)__ ]]; then
      local word="${BASH_REMATCH[2]}"
      read -r grammar
      read -r empty
      read -r definition
      read -r sentence
      read -r empty

      echo "## $word #card-reverse"
      echo $grammar
      echo $definition
      echo $sentence | sed 's/__[^_]\+__/`___`/g'
      echo
    else
      echo $line
    fi
  done
}

curl "$1" \
  | extract_content \
  | convert_to_obsidian_flashcards
