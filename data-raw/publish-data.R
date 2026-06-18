# Upload the generated full data asset to the stable GitHub release.
# This maintainer-side helper can use piggyback; installed package users fetch
# the public asset with utils::download.file().
#
# Run data-raw/preprints.R first so data-raw/preprints.rds exists.
library(piggyback)

asset <- "data-raw/preprints.rds"
stopifnot(file.exists(asset))

piggyback::pb_upload(
  file = asset,
  repo = "mvuorre/psyarxivr",
  tag = "data",
  name = "preprints.rds",
  overwrite = TRUE,
  show_progress = interactive()
)
