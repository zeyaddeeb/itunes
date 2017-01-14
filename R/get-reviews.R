#' @details #TODO
#' @description Get associated reviews with an iTunes id
#'
#' @title Get associated reviews with a specific iTunes object
#'
#'
#' @param object.id iTunes object id from search (defaults to current top object)
#'
#' @importFrom jsonlite toJSON fromJSON
#' @return Data Frame
#'
#' @examples
#' \dontrun{
#' reviews <- get_reviews("itunes.id")
#'
#' @export


get_reviews <- function(itunes.id=NULL){
  if(is.null(itunes.id)){
    stop('iTunes id is a required to proceed')
  }
  base_url <- sprintf('https://itunes.apple.com/us/rss/customerreviews/id=%s/json', itunes.id)
  last_page <- as.integer(strsplit(strsplit(jsonlite::fromJSON(base_url)$feed$link$attributes$href[4], "/")[[1]][7], "=")[[1]][2])
  reviews.df <- list()
  for (page in 1:last_page) {
    url <- sprintf('https://itunes.apple.com/us/rss/customerreviews/page=%s/id=%s/json', page, itunes.id)
    response <- jsonlite::fromJSON(url)
    entries <- response$feed$entry
    reviews <- cbind(
      entries$id$label,
      entries$author$name,
      entries$`im:rating`,
      entries$title,
      entries$content$label,
      entries$author$uri)
    reviews <- reviews[2:nrow(reviews),]
    colnames(reviews) <- c('review.id','author','rating','review.title','review.text',
                           'review.link')
    reviews.df <- rbind.data.frame(reviews.df, reviews)
  }
  return(reviews.df)
}
