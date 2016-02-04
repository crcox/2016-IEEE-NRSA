# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: build/icml2016_NRSA.pdf all clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: build/icml2016_NRSA.pdf removetempfiles

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

build/icml2016_NRSA.pdf: icml16_nrsa.tex
	latexmk -use-make -pdf -pdflatex="pdflatex --file-line-error" $<

removetempfiles:
	latexmk -c
icml16_nrsa.bbl: icml16_nrsa.bib
	bibtex icml16_nrsa

clean:
	latexmk -CA

#	build/icnl2016_NRSA.pdf:
#		pdflatex --jobname "icml2016_NRSA" --output-directory "build/" --file-line-error icml16_nrsa.tex
