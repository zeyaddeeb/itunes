

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


#> # A tibble: 108 × 7
#>    review.id           author rating              review.title
#>*      <fctr>            <chr>  <chr>                     <chr>
#>1  1522194473       tony arndt      5           worth the money
#>2  1522188743          hpburns      2             Uninteresting
#>3  1522178622      Nader hilmi      5                Amazing!!!
#>4  1522150059          michgro      1 A complete mess of a film
#>5  1522133793 Benni Baby Cakes      5                      Dang
#>6  1522010985     LeslieHenson      5             Terrific film
#>7  1521876920   Dragon77989789      4            ohonecanknowme
#>8  1521836888         bouk_man      5     One of Affleck's best
#>9  1521745063          Poria 1      5                    Review
#>10 1521684519        ridgrunnr      5        Fascinating story!
#># ... with 98 more rows, and 3 more variables: review.text <fctr>, review.link <chr>, review.date <chr>
```

```{r eval=FALSE}
library(itunes)
top.df <- get_top(n=10)

```

### Limitations

- Currently us is only implemented country.
- `get_reviews` is limited top most recent 500 reviews



<br>

### Inspired by: [Daniel Sequeira](https://twitter.com/danbras)

<br>

### Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
