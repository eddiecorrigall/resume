#!/bin/bash

set -e

export SCRIPT="$0"

export FORMAT="$1"
export ADOC="$2"

function usage() {
    echo "USAGE: $SCRIPT [pdf|html] [adoc file]"
}

function install_asciidoctor() {
    if [ -z "$(command -v asciidoctor)" ]; then
        brew install asciidoctor
    fi
}

function expect_adoc() {
    if [ -z "$ADOC" ]; then
        echo 'ERROR: missing adoc file path argument!' > /dev/stderr
        return 1
    fi
}

function generate_html() {
    expect_adoc
    install_asciidoctor
    asciidoctor "$ADOC"
}

function install_asciidoctor_pdf() {
    if [ -z "$(command -v asciidoctor-pdf)" ]; then
        gem install asciidoctor-pdf
    fi
}

function generate_pdf() {
    expect_adoc
    install_asciidoctor
    asciidoctor-pdf \
        -a pdf-stylesdir=themes \
        -a pdf-style=resume \
        -a pdf-fontsdir=fonts \
            "$ADOC"
}

case "$FORMAT" in
    html|HTML)
        time generate_html
        ;;
    pdf|PDF)
        time generate_pdf
        ;;
    all|ALL)
        time (
            generate_html
            generate_pdf
        )
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "ERROR: unknown format $FORMAT" > /dev/stderr
        exit 1
        ;;
esac

