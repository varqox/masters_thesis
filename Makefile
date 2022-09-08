.PHONY: all
all: main.pdf

main.pdf: main.tex references.bib pracamgr.cls Makefile
	pdflatex main.tex < /dev/null
	/usr/bin/vendor_perl/biber main
	pdflatex main.tex < /dev/null
