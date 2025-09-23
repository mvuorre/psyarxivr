

<!-- README.md is generated from README.qmd. Please edit that file -->

# psyarxivr

psyarxivr is an R package that provides access to
[PsyArXiv](https://osf.io/preprints/psyarxiv) preprint metadata within
R. The data is sourced from the [Open Science
Framework](https://osf.io/) API, and is updated monthly.

## Install

Install psyarxivr from
[GitHub](https://github.com/mvuorre/psyarxivr):

``` r
# install.packages("pak")
pak::pkg_install("mvuorre/psyarxivr")
```

## Use

``` r
library(psyarxivr)
library(tidyverse) # Data wrangling
library(knitr) # Table display
```

The package provides a single table of preprint metadata called
`preprints`. Here’s what the data look like (see `?preprints`):

``` r
glimpse(preprints)
#> Rows: 50,146
#> Columns: 27
#> $ id                             <chr> "25pnr_v1", "266vp_v1", "27b43_v1", "2q…
#> $ title                          <chr> "Adapting a Revised Child Anxiety and D…
#> $ description                    <chr> "*Abstract. *Education is an important …
#> $ date_created                   <dttm> 2016-08-29 18:54:36, 2016-12-14 13:53:…
#> $ date_modified                  <dttm> 2018-07-02 10:45:06, 2018-07-02 10:45:…
#> $ date_published                 <dttm> 2016-08-29 18:54:36, 2016-12-14 14:49:…
#> $ original_publication_date      <dttm> NA, NA, NA, NA, NA, NA, 2014-12-31 13:…
#> $ publication_doi                <chr> NA, NA, NA, NA, NA, NA, "https://doi.or…
#> $ preprint_doi                   <chr> "https://doi.org/10.31234/osf.io/25pnr"…
#> $ download_url                   <chr> "https://osf.io/download/57c484ed594d90…
#> $ license                        <chr> NA, "CC0 1.0 Universal", "CC0 1.0 Unive…
#> $ is_published                   <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
#> $ reviews_state                  <chr> "accepted", "accepted", "accepted", "ac…
#> $ version                        <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
#> $ is_latest_version              <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
#> $ has_coi                        <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ conflict_of_interest_statement <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ has_data_links                 <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ why_no_data                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ data_links                     <chr> "null", "null", "null", "null", "null",…
#> $ has_prereg_links               <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ why_no_prereg                  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ prereg_links                   <chr> "null", "null", "null", "null", "null",…
#> $ prereg_link_info               <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ contributors                   <chr> "[{\"full_name\": \"Kasturi Haldar\", \…
#> $ subjects                       <chr> "[[{\"id\": \"5b4e7425c6983001430b6c1e\…
#> $ tags                           <chr> "[\"Preprint\", \"psyarxiv\"]", "[\"awa…
```

### Example: Preprints over time

As an example, we tabulate the number of preprints created per year.

``` r
preprints |>
  mutate(
    year = floor_date(date_created, unit = "year") |> str_sub(1, 4)
  ) |>
  count(year) |>
  pivot_wider(names_from = year, values_from = n) |>
  kable()
```

<div id="tbl-year">

Table 1: Yearly new PsyArXiv preprints.

<div class="cell-output-display">

| 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 |  2025 |
|-----:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|------:|
|  187 |  992 | 2354 | 3583 | 6229 | 6704 | 6291 | 6717 | 6688 | 10401 |

</div>

</div>
