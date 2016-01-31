TAR=thesis
FILES=$(wildcard $(TAR).*)
EDIT=$(TAR).tex $(TAR).bib
TEMP=$(filter-out $(EDIT),$(FILES)) $(TAR)-blx.bib
$(TAR): $(TAR).tex $(TAR).bib
	-pdflatex $(TAR)
	-bibtex $(TAR)
	-pdflatex $(TAR)
	pdflatex $(TAR)
	evince $(TAR).pdf


.PHONY: clean test

test: $(TAR).tex
	-pdflatex $(TAR)

clean:
	rm -f $(TEMP)
