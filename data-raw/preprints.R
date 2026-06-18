# Get and clean raw data for package sample and release asset
library(readr)
library(dplyr)

# Download data ----------------------------------------------------------

url <- Sys.getenv("REMOTE_DUMP_URL", unset = "")
local_path <- "data-raw/psyarxiv.csv.gz"

if (url == "" && !file.exists(local_path)) {
  stop(
    "Remote URL for data dump required. Ensure 'REMOTE_DUMP_URL' is set.",
    call. = FALSE
  )
}

if (nzchar(url)) {
  dir.create(dirname(local_path), recursive = TRUE, showWarnings = FALSE)
  download.file(url, local_path, mode = "wb")
  message("Downloaded data to ", local_path)
} else {
  message("REMOTE_DUMP_URL is unset; using existing ", local_path)
}


# Save data --------------------------------------------------------------

preprints <- read_csv("data-raw/psyarxiv.csv.gz", show_col_types = FALSE) |>
  arrange(date_created, id)

# Sample data included in package
dir.create("data", showWarnings = FALSE)
preprints_sample <- preprints |>
  filter(grepl("2026-01-01", date_created))
usethis::use_data(preprints_sample, overwrite = TRUE)

# Full data for GitHub releases
saveRDS(preprints, "data-raw/preprints.rds", compress = "xz")
