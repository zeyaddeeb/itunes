#' Get Top Trending iTunes Objects
#' 
#'   @description This function returns the id(s) for the top n apps, that can be used to
#' pull reviews and ratings for a one or more apps
#'
#' @title Get Top n Apps, Songs, Albums, Movies and more... from iTunes
#'
#' @param media.types defaults to all current media types
#'
#' @return Data Frame
#'
#' @examples
#' \dontrun{
#' top_stuff <- get_top(n=10)
#'}
#'
#' @export


get_top <- function(n=10){
  all.media.types <- list(Audiobooks="topaudiobooks", FreeBooks="topfreeebooks",
                          PaidBooks = "toppaidebooks", TextBooks = "toptextbooks",
                          iOSAppsFree="topfreeapplications", iOSAppsPaid="newpaidapplications",
                          iTunesUCollections="topitunesucollections", iTunesUCourses="topitunesucourses",
                          MacApps="topfreemacapps", Movies="topmovies",
                          Music="topsongs", MusicVideos="topmusicvideos",
                          Podcasts="toppodcasts", TVShows="toptvepisodes")
  top.df <- list()
  for(i in all.media.types){
    url_json <- sprintf('https://itunes.apple.com/us/rss/%s/limit=%s/json', i, n)
    response_json <- jsonlite::fromJSON(url_json)
    top.temp.df <- cbind(
      response_json$feed$entry$id$attributes$`im:id`,
      response_json$feed$entry$`im:name`$label,
      response_json$feed$entry$`im:artist`$label,
      response_json$feed$entry$`im:price`$attributes$amount,
      response_json$feed$entry$`im:contentType`$attributes$label,
      response_json$feed$entry$category$attributes$label
    )
    top.df <- rbind.data.frame(top.df, top.temp.df)
  }
  colnames(top.df) <- c('itunes.id', 'name','made.by','price','category','sub.catgeory')
  return(top.df)
}
