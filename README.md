# KhanAcademy Vocabulary to Anki

Convert Khan Academy Unit Vocabulary[^1] to Anki flashcards.

[^1]: Example: https://www.khanacademy.org/ela/cc-2nd-reading-vocab/xfb4fc0bf01437792:cc-2nd-the-moon/xfb4fc0bf01437792:untitled-63/a/the-moon-unit-vocabulary

This project doesn't directly talking to Anki, it uses [Flashcards-Obsidian][] as a bridge.

## Usage

```bash
./gen.sh <url> [tts_script] > file.md
```

- Url examples: [url1][], [url2][].
- If specified *tts_script*, audios will be embeded.

[url1]: https://www.khanacademy.org/ela/cc-2nd-reading-vocab/xfb4fc0bf01437792:cc-2nd-fairy-tales-retold/xfb4fc0bf01437792:building-knowledge/a/fairy-tales-retold-unit-vocabulary
[url2]: https://www.khanacademy.org/ela/cc-2nd-reading-vocab/xfb4fc0bf01437792:cc-2nd-rural-suburban-urban/xfb4fc0bf01437792:rural-suburban-urban-building-knowledge/a/rural-suburban-urban-unit-vocabulary

### TTS Script

The *TTS_SCRIPT* should get the word given first command parameter and output the generated tts audio file to the *STDOUT*.

Here is the [example tts script](./example_tts.sh).

## Random Tips

### Remove IDs (to generate cards again during testing)

Enable vim mode.

```vim
:%s/^\^[0-9]+//
```

### Use `Obsidian-basic-reversed-code` type as "type in answer"

> NOTE: this is one-off change per profile. Seems [Flashcards-Obsidian][] will not recreate the note type as long as they exists.

- Remove the card type "Front / Back"
- Modify the card type "Back / Front"
  Front Template
  ```
  {{Back}}

  {{type:Front}}
  ```
  Back Template
  ```
  {{FrontSide}}

  <hr id=answer>
  ```


[Flashcards-Obsidian]: https://github.com/reuseman/flashcards-obsidian
