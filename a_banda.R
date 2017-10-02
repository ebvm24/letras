################################################################################
## Name: tidy_lyrics.R
## Description: Turn lyrics into tidy data.
## Author: ebvm
## Date: 2017-10-01
################################################################################

## Libraries
library(tidyverse)
library(tidytext)
library(reshape2)

## My Theme

my_theme <- theme_minimal()
theme_set(my_theme)

#source('scrape_lyrics.R')
## Tidy Data

all_songs <- readRDS(file = 'chico_buarque_song_list.rds')

stop_words_pt <- read_table('stopwords.txt',col_names='word')

a <- all_songs$`A Banda`

lyrics <- melt(a$lyrics)
names(lyrics) <- c('Lyric','Stanza')

lyrics$Lyric <- as.character(lyrics$Lyric)
lyrics$Line <- seq(1,length(lyrics$Lyric))

lyrics <- as_data_frame(lyrics)

# Unnest Tokens
tidy_song <- lyrics %>%
  unnest_tokens(word,Lyric) %>%
  anti_join(stop_words_pt)

tidy_song %>%
  count(word, sort=TRUE) %>%
  mutate(word = reorder(word,n)) %>%
  filter(n>1) %>%
  ggplot(aes(x=word, y=n,fill=n)) +
  geom_col()+
  scale_fill_gradient2(low = "yellow", mid = "forestgreen",high = "blue", midpoint = 5) +
  xlab(NULL)+
  coord_flip()

## All of Chico Buarque's Songs in Portuguese
all <- all_songs

span <- c('Mar Y Luna')
fren <- c('La Nuit Des Masques')
ital <- c('La TV', 'La Rita', 'La Banda', 'Vita',
          'Una Mia Canzone','Tu Sei Una Di Noi',
          'Rotativa',
          'Queste e Quelle',
          'Oh Che Sarà',
          'Non Vuoi Ascoltare',
          "Maddalena E' Andata Via",
          "Lei No, Lei Sta Ballando (Ela Desatinou)",
          "In Te (Mulher, Vou Dizer Quanto Eu Te Amo)",
          "In Memoria Di Un Congiurate",
          "Il Nome Di Maria (Não Fala de Maria)",
          "Genova Per Noi",
          "Funerale Di Un Contadino",
          "Far Niente (Bom Tempo)",
          "Ed Ora Dico Sul Serio (Agora Falando Sério)",
          "C´è più samba",
          "Ciao, Ciao, Addio",
          "C'è Più Samba")

map_lyrics <- function(x){
  if(length(x[['lyrics']])==0){
    return(NA)
  }
  df <- data.frame(melt(x[['lyrics']]))
  df$Song <- x[['name']]
  names(df) <- c('Lyric', 'Stanza', 'Song')
  return(df)
}

lyrics <- map(all,map_lyrics)
lyrics <- do.call(rbind.data.frame,lyrics)
lyrics <- lyrics1 %>% 
  group_by(Song) %>%
  mutate(Line = seq(1,length(Lyric)),
         Lyric = as.character(Lyric)) %>%
  ungroup()
lyrics <- as_data_frame(lyrics) %>%
  filter(!Song %in% fren,
         !Song %in% ital,
         !Song %in% span) # Let's just consider portuguese songs, please


## Unnest Tokens in All Songs
# Unnest Tokens
tidy_songs <- lyrics %>%
  unnest_tokens(word,Lyric) %>%
  anti_join(stop_words_pt)

tidy_songs %>%
  count(word, sort=TRUE) %>%
  mutate(word = reorder(word,n)) %>%
  top_n(20,n) %>%
  ggplot(aes(x=word, y=n,fill=n)) +
  geom_col()+
  scale_fill_gradient2(low = "yellow", mid = "forestgreen",high = "dodgerblue3", midpoint = 50) +
  xlab(NULL)+
  coord_flip()

pra <- lyrics %>%
  filter(grepl('pra',Lyric)) %>% distinct(Song)
pra
che <- lyrics %>%
  filter(grepl(' che ',Lyric)) %>% distinct(Song)
che %>% print(n=25)

#' Ok, some of these words should be added to our stop words file:
#' pra: contraction of para
#' 
