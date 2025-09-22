# Run this with `make`
all: man/psyarxivdbr-package.Rd README.md

# Create R documentation
man/psyarxivdbr-package.Rd: R/data.R R/psyarxivdbr-package.R DESCRIPTION NAMESPACE
	Rscript -e "devtools::document()"

# Render README.md
README.md: README.qmd
	quarto render $<

# Fetch and process raw data to R object
data/preprints.rda: data-raw/preprints.R
	mkdir -p data
	Rscript $<
