SRC_DIR = src
OUT_DIR = build
$(shell mkdir $(OUT_DIR) 2>/dev/null)

MAINFILE = songbook

PDFLATEX = latexmk
PDFLATEX_FLAGS := -output-directory=$(OUT_DIR) -pdf

.PHONY: all
all: $(MAINFILE).pdf ## ## Compile the LaTeX project. This will build a PDF document.

$(MAINFILE).pdf:
	$(PDFLATEX) $(PDFLATEX_FLAGS) $(MAINFILE)
	# $(PDFLATEX) $(PDFLATEX_FLAGS) $(MAINFILE)

.PHONY: show
show: # Open the output PDF
	open ./$(OUT_DIR)/$(MAINFILE).pdf

.PHONY: link
link: ## Run link-songs.sh - this will create a new index.tex file.
	./link-songs.sh

.PHONY: clean
clean: ## Remove LaTeX build files
	-rm -f $(addprefix $(OUT_DIR)/*., aux log toc bbl blg out fls fdb_latexmk ps dvi bcf xml)

.PHONY: cleanall
cleanall: ## Remove the entire output (build) directory
	-rm -rf $(OUT_DIR)

.PHONY: help
help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

