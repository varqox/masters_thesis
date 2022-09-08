.PHONY: all
all: main.pdf

main.pdf: main.tex references.bib pracamgr.cls Makefile
	pdflatex main.tex < /dev/null
	/usr/bin/vendor_perl/biber main
	pdflatex main.tex < /dev/null

.PHONY:
watch:
	make main.pdf
	inotifywait -e close_write -m main.tex pracamgr.cls references.bib Makefile | while read; do sleep 0.1 && make main.pdf; done
