# Resume

This is where I host my personal resume.

## Installation

```{r, engine='bash', count_lines}
# Install gem
apt-get install rubygems-integration

# Install asciidoctor
gem install asciidoctor
gem install asciidoctor-pdf
```

## Generate Document

```{r, engine='bash', count_lines}
# Generate HTML
asciidoctor latest.adoc

# Generate PDF
asciidoctor-pdf latest.adoc
```
