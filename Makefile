TAR=thesis
FILES=$(wildcard $(TAR).*)
EDIT=$(TAR).tex $(TAR).bib
TEMP=$(filter-out $(EDIT),$(FILES)) $(TAR)-blx.bib
all: $(TAR).tex $(TAR).bib
	-pdflatex $(TAR)
	-bibtex $(TAR)
	-pdflatex $(TAR)
	pdflatex $(TAR)
	evince $(TAR).pdf


.PHONY: clean test oral

test: $(TAR).tex
	-pdflatex $(TAR)

oral: oral.tex $(TAR).bib
	-pdflatex $@
	-bibtex $(TAR)
	-pdflatex $@
	pdflatex $@
	evince oral.pdf

clean:
	rm -f $(TEMP)
