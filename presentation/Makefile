.PHONY: all
all: main.pdf

main.pdf: main.tex sim.png submission.png Makefile
	rm -rf cache
	mkdir cache
	pdflatex -halt-on-error -output-dir=cache main.tex < /dev/null
	pdflatex -halt-on-error -output-dir=cache main.tex < /dev/null
	cp cache/$@ $@

.PHONY:
watch:
	make main.pdf; inotifywait -e close_write -m main.tex sim.png submission.png Makefile | while read; do sleep 0.1 && make main.pdf; done
