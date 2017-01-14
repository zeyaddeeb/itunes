itunes is an R package interface to the iTunes RSS Feeds

The following functions are implemented:

get_reviews: Download reviews associated with an App, Movie or Other

Installation

devtools::install_github("thelostscientist/itunes")
Usage

library(itunes)

reviews.df <- get_reviews(1161476603)

Inspired by: Daniel Sequeira

Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
