

`itunes` is an R package interface to the [iTunes RSS Feeds](http://www.apple.com/rss/)

The following functions are implemented:

- `get_reviews`: Download reviews associated with an App, Movie or Other
- `get_top`: Search top n items based on iTunes downloads

The following functions are in progress:
- `search_itunes`:  Search existing apps to get their iTunes id for reviews & ratings
- `get_top_movies`: Get a list of top/trending Movies on iTunes + SubCategories
- `get_top_hits`: Get a list of top/trending Songs on iTunes + SubCategories
- `get_top_albums`:  Get a list of top/trending Albums on iTunes + SubCategories
- `get_top_apps`:  Get a list of top/trending Apps on iTunes + SubCategories

### Installation

```{r eval=FALSE}
devtools::install_github("thelostscientist/itunes")
```



### Usage

```{r eval=FALSE}
library(itunes)
reviews.df <- get_reviews(1161476603)
```
```{r eval=FALSE}
library(itunes)
top.df <- get_top(n=10)
```

### Current Limitations

- Currently us is only implemented country.
- `get_reviews` is limited top most recent 500 reviews



<br>

### Inspired by: [Daniel Sequeira](https://twitter.com/danbras)

<br>

### Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
