#!/bin/bash

set -e

if [ -z "$(command -v asciidoctor)" ]; then
    brew install asciidoctor
fi

asciidoctor latest.adoc

if [ -z "$(command -v asciidoctor-pdf)" ]; then
    gem install asciidoctor-pdf
fi

asciidoctor-pdf \
    -a pdf-stylesdir=themes \
    -a pdf-style=resume \
    -a pdf-fontsdir=fonts \
        latest.adoc
