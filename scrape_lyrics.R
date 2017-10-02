################################################################################
## Name: scrape_lyrics.R
## Description: Functions to scrape lyrics from letras.musica.
## Author: ebvm
## Date: 2017-10-01
################################################################################

## Libraries
library(tidyverse)
library(rvest)

## Site
site <- 'https://www.letras.com'
artist_page <- 'https://www.letras.com/chico-buarque/'


song_index <- artist_page %>%
  read_html() %>%
  html_nodes("#cnt-artist-songlist > div.cnt-list--alp > ul") %>%
  html_children()

get_lyrics <- function(link){
  scrape <- link %>% 
    read_html()
  lyrics <- scrape %>%
    html_nodes("#js-lyric-cnt > div.g-pr.g-sp > div.cnt-letra > article") %>%
    html_children() %>%
    gsub(pattern = '<br>', replacement = "\n") %>%
    gsub(pattern = '<.*?>', replacement = '')
  lyrics1 <- strsplit(lyrics,'\n')
  return(lyrics1)
}

song_info <- function(a){
  d <- a %>% html_children()
  song <- list(name=html_text(d))
  song[['link']] <- paste0(site,html_attr(d,"href"))
  song[['lyrics']] <- tryCatch(get_lyrics(song$link), error = function(e) e)
  return(song)
}

all_songs <- map(song_index,song_info)
names(all_songs) <- lapply(all_songs, function(x) x$name)

saveRDS(all_songs, file = 'chico_buarque_song_list.rds')
