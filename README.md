# Resume

This is where I host *[my personal resume](resume-eddie-corrigall-20231002.pdf)*.

## Generating File Formats

This reads the asciidoc *.adoc file, and generates html and pdf files.

```shell
# Show help
./build.sh --help

# Build resume in ALL formats
./build.sh all *.adoc

# Build and open pdf resume
./build.sh pdf *.adoc
```

## Spell Checking

If using VS Code, then install the [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) extension to get spelling hints and suggestions.