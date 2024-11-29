.DEFAULT_GOAL := build_pdf

SHELL := /bin/bash

ASCIIDOCTOR := asciidoctor
RELEASE_DIR := ../../releases

build_pdf:
	$(ASCIIDOCTOR) -r asciidoctor-pdf \
		-b pdf \
		-D ${RELEASE_DIR} \
		-a pdf-theme=my \
		-a pdf-themesdir=resources \
		dune.adoc
