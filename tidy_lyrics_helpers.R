################################################################################
## Name: tidy_lyrics_helpers.R
## Description: Subroutines to turn lyrics into tidy data.
## Author: ebvm
## Date: 2017-10-15
################################################################################

#' Function takes lyrics from one song stored in a list and converts it to 
#' a dataframe, with song, line, and stanza information as columns
lyrics_df <- function(song, simplify = F){
  require(reshape2)
  lyrics <- melt(song[['lyrics']])
  names(lyrics) <- c('Lyric','Stanza')
  
  lyrics$Lyric <- as.character(lyrics$Lyric)
  lyrics$Line <- seq(1,length(lyrics$Lyric))
  
  lyrics <- as_data_frame(lyrics)
  
  
  if(simplify){
    lyrics <- lyrics %>% 
      group_by(Lyric) %>% 
      top_n(1,-Line) %>%
      ungroup()
  }
  lyrics$Song <- song$name
  
  return(lyrics)
  
}

#' Function to apply lyrics_df across all_songs list
#' returns NA if no lyrics were captured
map_lyrics <- function(x,simp=F){
  if(length(x[['lyrics']])==0){
    return(NA)
  }
  df <- lyrics_df(x,simplify=simp)
  return(df)
}
#' Function to bind all song lyric dataframes to one df and apply Line and Lyrics
clean_lyrics <- function(song_list,simp=F){
  lyrics <- map(song_list, map_lyrics, simp)
  lyrics <- do.call(rbind.data.frame, lyrics)
  lyrics <- lyrics %>% as_data_frame()
  return(lyrics)
}
