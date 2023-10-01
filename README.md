# Resume

This is where I host *[my personal resume](latest.pdf)*.

## Generating File Formats

This reads the asciidoc latest.adoc file, and generates html and pdf files.

```bash
# Show help
./build.sh --help

# Build resume in ALL formats
./build.sh all latest.adoc

# Build and open pdf resume
./build.sh pdf latest.adoc
```

## Spell Checking

If using VS Code, then install the [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) extension to get spelling hints and suggestions.