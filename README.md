# Resume

This is where I host my personal resume.

## Installation

```{r, engine='bash', count_lines}
# Install gem
apt-get install rubygems-integration

# Install asciidoctor
gem install asciidoctor
```

## Generate Document

```{r, engine='bash', count_lines}
# Generate HTML
asciidoctor eddiecorrigall_resume.adoc

# Generate PDF
asciidoctor-pdf eddiecorrigall_resume.adoc
```