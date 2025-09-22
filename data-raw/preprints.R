# Get and clean raw data to package file
library(tidyverse)

# Get latest dump (updates 1st of every month)
REMOTE_DUMP_URL <- Sys.getenv("REMOTE_DUMP_URL", unset = "")
LOCAL_DUMP_PATH <- "data-raw/psyarxiv.csv.gz"
if (REMOTE_DUMP_URL == "") {
  stop("Remote URL for data dump required. Ensure 'REMOTE_DUMP_URL' is set.")
}
system(
  str_glue("scp {REMOTE_DUMP_URL} {LOCAL_DUMP_PATH}")
)

# Wrangle
preprints <- read_csv("data-raw/psyarxiv.csv.gz")

glimpse(preprints)

# Save data to package
usethis::use_data(preprints, overwrite = TRUE, compress = "bzip2")
