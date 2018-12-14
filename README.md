# GitHub Actions for spell-checking with Aspell

## Usage

`.github/main.workflow`:

```hcl
workflow "Spell Checking with Aspell" {
  on = "push"
  resolves = ["GitHub Action for Aspell"]
}

action "GitHub Action for Aspell" {
  uses = "mh61503891/action-paper-aspell@master"
  env = {
    ASPELL_LANG = "en"
    ASPELL_MODE = "tex"
    ASPELL_PERSONAL = "./.aspell.en.pws"
    ASPELL_FILES = "main.tex main.bib"
  }
}
```

### Environment variables

|NAME|Default Value|Aspell's option|
|---|---|---|
|ASPELL_LANG|en|--lang|
|ASPELL_MODE|tex|--mode|
|ASPELL_PERSONAL|./.aspell.${ASPELL_LANG}.pws|--personal|
|ASPELL_FILES|main.tex main.bib|These files are streamed to `aspell` by `cat`.|

## License

This action is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Author

Masayuki Higashino
