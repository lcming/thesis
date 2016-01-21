TAR=thesis
FILES=$(wildcard $(TAR).*)
EDIT=$(TAR).tex $(TAR).bib
$(TAR): $(TAR).tex $(TAR).bib
	-pdflatex $(TAR)
	-bibtex $(TAR)
	-pdflatex $(TAR)
	pdflatex $(TAR)
	evince $(TAR).pdf

.PHONY: clean

clean:
	rm -f $(filter-out $(EDIT),$(FILES)) $(TAR)-blx.bib
