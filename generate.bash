#!/bin/bash

set -e

if [ -z "$(command -v asciidoctor)" ]; then
    brew install asciidoctor
fi

echo -n 'make html'
time asciidoctor latest.adoc
echo

if [ -z "$(command -v asciidoctor-pdf)" ]; then
    gem install asciidoctor-pdf
fi

echo -n 'make pdf'
time asciidoctor-pdf \
    -a pdf-stylesdir=themes \
    -a pdf-style=resume \
    -a pdf-fontsdir=fonts \
        latest.adoc
echo
