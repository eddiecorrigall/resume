#!/bin/bash

set -e

export SCRIPT="$0"

export FORMAT="$1"
FORMAT="${FORMAT:-all}"

export ADOC="$2"
ADOC="${ADOC:-*.adoc}"

export GEM_HOME=~/.gem

function usage() {
    echo "USAGE: $SCRIPT <all|html|pdf> <adoc file>"
    echo 'Supported formats: all, html, pdf'
}

function install_dependencies() {
    mkdir -p ~/.gem
    if [[ "$(gem list -i '^asciidoctor$')" == "false" ]]; then
        bundle install
    fi
}

function asciidoctor() {
    bundle exec asciidoctor "$@"
}

function asciidoctor-pdf() {
    bundle exec asciidoctor-pdf "$@"
}

function expect_adoc() {
    if [ -z "$ADOC" ]; then
        echo 'ERROR: missing adoc file path argument!' > /dev/stderr
        usage
        return 1
    fi
}

function check_spelling() {
    npx cspell *.adoc
}

function generate_html() {
    expect_adoc
    install_dependencies
    asciidoctor "$ADOC"
}

function generate_pdf() {
    expect_adoc
    install_dependencies
    asciidoctor-pdf --trace "$ADOC"
}

case "$FORMAT" in
    html|HTML)
        check_spelling
        generate_html
        ;;
    pdf|PDF)
        check_spelling
        generate_pdf
        ;;
    all|ALL)
        check_spelling
        generate_html
        generate_pdf
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "ERROR: unknown format $FORMAT" > /dev/stderr
        usage
        exit 1
        ;;
esac

echo 'done!'
