# Get and clean raw data to package file
library(tidyverse)
library(httr2)

# Download data ----------------------------------------------------------

# Create & check paths
url <- Sys.getenv("REMOTE_DUMP_URL", unset = "")
if (url == "") {
  stop("Remote URL for data dump required. Ensure 'REMOTE_DUMP_URL' is set.")
}
local_path <- "data-raw/psyarxiv.csv.gz"
etag_path <- paste0(local_path, ".etag")

# Read stored ETag if it exists
stored_etag <- if (file.exists(etag_path)) {
  readLines(etag_path, warn = FALSE)[1]
} else {
  NULL
}

# Build request with conditional header
req <- request(url)
if (!is.null(stored_etag)) {
  req <- req_headers(req, `If-None-Match` = stored_etag)
}

# Make request
resp <- req_perform(req)

# Check response, download if etag changed
if (resp_status(resp) == 304) {
  message("File unchanged, using cached version")
} else {
  # Save file
  writeBin(resp_body_raw(resp), local_path)

  # Save new ETag for next time
  new_etag <- resp_header(resp, "etag")
  if (!is.null(new_etag)) {
    writeLines(new_etag, etag_path)
  }

  message("File downloaded and updated")
}

# Save data to package ---------------------------------------------------

# Wrangle
preprints <- read_csv("data-raw/psyarxiv.csv.gz")

# Save data to package
usethis::use_data(preprints, overwrite = TRUE, compress = "bzip2")
