#' Search for an Podcast, App id on iTunes
#'
#' @param searchterm 
#'
#' @return data.frame

#'
#' @examples
#' \dontrun{
#' top_stuff <- search_itunes('Radiolab')
#' }
#' @export



search_itunes <- function(searchterm=NULL){
  if(is.null(searchterm)){
    stop('Enter a search term')
  }
  possible_categories <- c('apple_music','audiobooks','books','connect','ios_apps',
                           'itunes_music','macos_apps','movies','podcasts','tvos_apps')
  for(i in possible_categories){
    url.search <- sprintf('https://linkmaker.itunes.apple.com/en-us/search?term=%s&country=us&mediaType=%s',URLencode(searchterm), i)
    search.content <- rvest::html(url.search)
    
  }
}