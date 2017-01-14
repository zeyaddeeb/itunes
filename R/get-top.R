#' @description This function returns the id(s) for the top 10 apps, that can be used to
#' pull reviews and ratings for a one or more apps
#'
#' @title Get Top n Apps, Songs, Albums, Movies and more... from iTunes
#'
#' @param media.types defaults to current media types, see get_media_types for details
#'
#' @importFrom jsonlite toJSON fromJSON
#' @return Data Frame
#'
#' @examples
#' \dontrun{
#' top_stuff <- get_top("iOSApps", n=10)
#'
#' @export


get_top <- function(media.types, n=10){
  media.types <- list_media_types()
}
