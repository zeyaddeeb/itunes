

`itunes` is an R package interface to the [iTunes RSS Feeds](http://www.apple.com/rss/)

The following functions are implemented:

- `get_reviews`: Download reviews associated with an App, Movie or Other

### Installation

```{r eval=FALSE}
devtools::install_github("thelostscientist/itunes")
```
```{r echo=FALSE, message=FALSE, warning=FALSE, error=FALSE}
options(width=120)
```
### Usage

```{r eval=FALSE}
library(itunes)
reviews.df <- get_reviews(1161476603)
```



### Inspired by: Daniel Sequeira



### Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
