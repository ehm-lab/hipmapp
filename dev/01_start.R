########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## FOR DESCRIPTION
## APP METADATA
## USE TO PROPAGATE IMPORTANT UPDATES (NAME CHANGE)
golem::fill_desc(
  pkg_name = "hipmapp", # The Name of the package containing the App
  pkg_title = "Health Impact Projections MApp", # The Title of the package containing the App
  pkg_description = "Wraps Shiny App for Interactive Visualisation of Health Impact Projections.", # The Description of the package containing the App
  author_first_name = "Arturo", # Your First Name
  author_last_name = "de la Cruz Libardi", # Your Last Name
  author_email = "Arturo.de-la-Cruz-Libardi@lshtm.ac.uk", # Your Email
  repo_url = "https://github.com/ehm-lab/hipmapp", # The URL of the GitHub Repo (optional),
  pkg_version = "0.0.1.0000" # The Version of the package containing the App
)

## Set {golem} options ----
golem::set_golem_options()

## Install the required dev dependencies ----
golem::install_dev_deps()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Favicon ----
golem::use_favicon() # path = "path/to/ico". Can be an online file.
# golem::remove_favicon()

## Add helper functions ----
golem::use_utils_ui(with_test = TRUE)
golem::use_utils_server(with_test = TRUE)

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile("dev/02_dev.R")
