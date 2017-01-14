#' get-media-types
#'
#' Print List of Avaliable Media Types
#'
#'
#' @export
#'

list_media_types <- function(){
  media.types <- list(Audiobooks="Audiobooks", Books="topfreeebooks",
                      iOSApps="newapplications", iTunesU="topitunesucollections",
                      MacApps="topfreemacapps", Movies="topmovies",
                      Music="topsongs", MusicVideos="topmusicvideos",
                      Podcasts="toppodcasts", TVShows="toptvepisodes")
  print(names(media.types))
}

