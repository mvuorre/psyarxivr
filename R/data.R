#' @importFrom tibble tibble
NULL

#' PsyArXiv reprint metadata from the Open Science Framework.
#'
#' Preprint metadata from the Open Science Framework. All data licensed to preprint authors as indicated.
#'
#' @format A data frame with 15 variables:
#' \describe{
#' \item{`id`}{Preprint identifier (chr).}
#' \item{`title`}{Preprint title (chr).}
#' \item{`description`}{Preprint description or abstract (chr).}
#' \item{`date_created`}{The time at which the preprint was created, as an iso8601 formatted timestamp. (dttm).}
#' \item{`date_modified`}{The time at which the preprint was last modified, as an iso8601 formatted timestamp. (dttm).}
#' \item{`date_published`}{The time at which the preprint was published, as an iso8601 formatted timestamp. (dttm).}
#' \item{`original_publication_date`}{When published elsewhere (dttm).}
#' \item{`publication_doi`}{DOI of document published elsewhere (chr).}
#' \item{`preprint_doi`}{Preprint's DOI with full URL (chr).}
#' \item{`download_url`}{URL to download preprint document (chr).}
#' \item{`license`}{License (chr).}
#' \item{`is_published`}{Is preprint published on PsyArXiv.}
#' \item{`reviews_state`}{Is preprint reviewed/accepted at PsyArXiv.}
#' \item{`version`}{Preprint version (int).}
#' \item{`is_latest_version`}{Is this the preprint's latest version (lgl).}
#' \item{`has_coi`}{A value indicating whether the preprint has a conflict of interest statement.}
#' \item{`conflict_of_interest_statement`}{The text of the conflict of interest statement for the preprint.}
#' \item{`has_data_links`}{A value indicating whether the preprint has a links to data.}
#' \item{`why_no_data`}{A value for a field explaining why preregistration data was not included.}
#' \item{`data_links`}{Any links to a preprints supplemental data go here.}
#' \item{`has_prereg_links`}{A value indicating whether the preprint has any preregistration links.}
#' \item{`why_no_prereg`}{A value for a field explaining why preregistration links weren't included.}
#' \item{`prereg_links`}{Any links to a preprints preregistrations go here.}
#' \item{`prereg_link_info`}{The text of the any explanation of preprint preregistration link infomation.}
#' \item{`contributors`}{Contributor metadata (chr/JSON).}
#' \item{`subjects`}{Subject metadata (chr/JSON).}
#' \item{`tags`}{Tags (chr/JSON).}
#' }
#'
#' @return a [tibble][tibble::tibble-package]
#'
#' For further details, see <https://developer.osf.io/#tag/Preprints>.
"preprints"
