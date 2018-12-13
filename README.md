# GitHub Actions for Aspell

## Usage

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
