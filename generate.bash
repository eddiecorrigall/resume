#!/bin/bash

set -e

if [ -z "$(command -v asciidoctor)" ]; then
    gem install asciidoctor
fi

if [ -z "$(command -v asciidoctor-pdf)" ]; then
    gem install asciidoctor-pdf
fi

asciidoctor latest.adoc
asciidoctor-pdf \
    -a pdf-stylesdir=themes \
    -a pdf-style=resume \
    latest.adoc
