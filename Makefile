SRC_DIR = src
OUT_DIR = build
$(shell mkdir $(OUT_DIR) 2>/dev/null)

MAINFILE := $(SRC_DIR)/songbook

PDFLATEX = pdflatex
PDFLATEX_FLAGS := -halt-on-error -output-directory $(OUT_DIR)

$(MAINFILE).pdf:
		$(PDFLATEX) $(PDFLATEX_FLAGS) $(MAINFILE)
		# $(PDFLATEX) $(PDFLATEX_FLAGS) $(MAINFILE)

.PHONY: clean
clean:
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.toc
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.out

.PHONY: cleanall
cleanall: clean
	-rm -f *.pdf
	-rm -f *.ps
	-rm -f *.dvi
	-rm -rf $(OUT_DIR)
