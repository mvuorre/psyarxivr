# Run this with `make`
all: man/psyarxivr-package.Rd

# Create R documentation
man/psyarxivr-package.Rd: R/data.R R/preprints.R R/psyarxivr-package.R DESCRIPTION NAMESPACE
	Rscript -e "devtools::document()"

# Fetch and process raw data to package sample and release asset
data: data/preprints_sample.rda data-raw/preprints.rds
data/preprints_sample.rda data-raw/preprints.rds: data-raw/preprints.R
	mkdir -p data
	Rscript $<

# Upload data-raw/preprints.rds to the GitHub data release
publish-data: data-raw/preprints.rds
	Rscript data-raw/publish-data.R
