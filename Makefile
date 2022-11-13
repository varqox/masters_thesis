.PHONY: all
all: main.pdf

main.pdf: main.tex references.bib pracamgr.cls Makefile
	pdflatex -halt-on-error main.tex < /dev/null
	/usr/bin/vendor_perl/biber main
	pdflatex -halt-on-error main.tex < /dev/null
	rm -f main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc

.PHONY:
watch:
	make main.pdf; inotifywait -e close_write -m main.tex pracamgr.cls references.bib Makefile | while read; do sleep 0.1 && make main.pdf; done
