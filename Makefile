.PHONY: all
all: main.pdf

main.pdf: main.tex references.bib pracamgr.cls Makefile
	make -p utils/latex
	rm -rf utils/latex/main.*
	pdflatex -halt-on-error -output-dir=utils/latex main.tex < /dev/null
	/usr/bin/vendor_perl/biber utils/latex/main.bcf
	pdflatex -halt-on-error -output-dir=utils/latex main.tex < /dev/null
	cp utils/latex/$@ $@

.PHONY:
watch:
	make main.pdf; inotifywait -e close_write -m main.tex pracamgr.cls references.bib Makefile | while read; do sleep 0.1 && make main.pdf; done
