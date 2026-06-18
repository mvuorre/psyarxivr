#' Download and load full PsyArXiv preprint metadata
#'
#' `get_preprints()` returns the full PsyArXiv preprint metadata table. The
#' first call downloads `preprints.rds` from the package's GitHub data release
#' and caches it locally. Later calls use the cached copy unless
#' `refresh = TRUE`.
#'
#' @param refresh Logical. If `TRUE`, download the release asset before
#'   reading the data.
#' @param cache_dir Directory where the downloaded data should be cached.
#' @param quiet Logical. If `TRUE`, suppress status messages and download
#'   progress.
#'
#' @return A tibble containing full PsyArXiv preprint metadata.
#' @export
get_preprints <- function(
  refresh = FALSE,
  cache_dir = tools::R_user_dir("psyarxivr", "data"),
  quiet = FALSE
) {
  cache_file <- file.path(cache_dir, .psyarxivr_data_asset)

  if (refresh || !file.exists(cache_file)) {
    .download_preprints(cache_file, quiet = quiet)
  }

  readRDS(cache_file)
}

.psyarxivr_data_asset <- "preprints.rds"

.preprints_download_url <- paste0(
  "https://github.com/mvuorre/psyarxivr/releases/download/data/",
  .psyarxivr_data_asset
)

.download_preprints <- function(cache_file, quiet = FALSE) {
  dir.create(dirname(cache_file), recursive = TRUE, showWarnings = FALSE)
  utils::download.file(
    .preprints_download_url,
    cache_file,
    mode = "wb",
    quiet = quiet
  )
  if (!quiet) {
    message("Cached PsyArXiv preprints at ", cache_file, ".")
  }
}
