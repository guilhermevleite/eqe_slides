.PHONY: all clear

all:
	latexmk -pvc -pdf

clear:
	rm -f *.aux *.fdb_latexmk *.fls *.lof *.log *.lot *.out EQE.pdf *.toc *.bbl *.blg *.dvi *.nav *.snm
