.PHONY: all
all: main.pdf

main.pdf: main.tex references.bib pracamgr.cls Makefile
	rm -rf cache
	mkdir cache
	pdflatex -halt-on-error -output-dir=cache main.tex < /dev/null
	/usr/bin/vendor_perl/biber cache/main.bcf
	pdflatex -halt-on-error -output-dir=cache main.tex < /dev/null
	cp cache/$@ $@

.PHONY:
watch:
	make main.pdf; inotifywait -e close_write -m main.tex pracamgr.cls references.bib Makefile | while read; do sleep 0.1 && make main.pdf; done
