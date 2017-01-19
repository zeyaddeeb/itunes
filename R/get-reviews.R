#' Get Reviews for a specific iTunes objects
#' 
#' @details This function retrives all reviews associated with App, Podcast or Movie.
#' The standard limit provided by Apple is 500 reviews, ie. if the object has more than
#' 500 reviews, the most recent 500 will be retrieved. This is a limitation of rss feeds 
#' @description Get associated reviews with an iTunes id
#'
#' @title Get associated reviews with a specific iTunes object
#'
#'
#' @param itunes.id iTunes object id from search (defaults to current top object)
#'
#' @return data.frame
#'
#' @examples
#' \dontrun{
#' reviews.df <- get_reviews(1161476603)
#'}
#' @export


get_reviews <- function(itunes.id=NULL){
  if(is.null(itunes.id)){
    stop('iTunes id is a required to proceed')
  }
  base_url <- sprintf('https://itunes.apple.com/us/rss/customerreviews/id=%s/json', itunes.id)
  last_page <- as.integer(strsplit(strsplit(jsonlite::fromJSON(base_url)$feed$link$attributes$href[4], "/")[[1]][7], "=")[[1]][2])
  reviews.df <- list()
  for (page in 1:last_page) {
    url_json <- sprintf('https://itunes.apple.com/us/rss/customerreviews/page=%s/id=%s/json', page, itunes.id)
    response_json <- jsonlite::fromJSON(url_json)
    url_xml <- sprintf('https://itunes.apple.com/us/rss/customerreviews/page=%s/id=%s/xml', page, itunes.id)
    response_xml <- xml2::read_xml(url_xml)
    entries_xml <- xml2::xml_children(response_xml)[xml2::xml_name(xml2::xml_children(response_xml))=='entry']
    entries_xml <- entries_xml[-1]
    review.dates <- xml2::xml_text(xml2::xml_children(entries_xml))[xml2::xml_name(xml2::xml_children(entries_xml))=='updated']
    entries_json <- response_json$feed$entry
    entries_json <- entries_json[-1]
    reviews <- cbind(
      entries_json$id$label,
      entries_json$author$name,
      entries_json$`im:rating`,
      entries_json$title,
      entries_json$content$label,
      entries_json$author$uri)
    colnames(reviews) <- c('review.id','author','rating','review.title','review.text',
                           'review.link')
    reviews$review.date <- review.dates
    reviews$rating <- as.integer(reviews$rating)
    reviews.df <- rbind.data.frame(reviews.df, reviews)
  }
  return(reviews.df)
}
