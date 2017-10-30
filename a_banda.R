################################################################################
## Name: tidy_lyrics.R
## Description: Turn lyrics into tidy data.
## Author: ebvm
## Date: 2017-10-01
################################################################################

## Libraries
library(tidyverse)
library(tidytext)
library(elisalib)
library(forcats)

library(devtools)
theme_set(theme_ebvm())

#source('clean_chico.R')
source('tidy_lyrics_helpers.R')

## Read in the songs, album list, and stop words
all_songs <- readRDS(file = 'chico_buarque_song_list.rds')
album_df <- read_csv(file = 'chico_buarque_album_df.csv')
stop_words_pt <- read_table('stopwords.txt',col_names='word') %>%
  full_join(data_frame(word='pra'))

## Consider one song at a time
pick_a_song <- 'A Banda'
song <- all_songs[[pick_a_song]]

lyrics <- lyrics_df(song,simplify=T)

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
  coord_flip()+
  labs(title = pick_a_song)

portuguese <- all_songs[!names(all_songs) %in% album_df$Language[album_df$Language=='Portuguese']]

lyrics <- clean_lyrics(portuguese,simp=F)
lyrics_simplified <- clean_lyrics(portuguese,simp=T)

## Unnest Tokens in All Songs
# Unnest Tokens
tidy_songs <- lyrics %>%
  unnest_tokens(word,Lyric) %>%
  anti_join(stop_words_pt)

tidy_count <- tidy_songs %>%
  count(word,sort=TRUE) %>%
  mutate(word = reorder(word, n)) %>%
  mutate(Simplified =F)

## Simplified (i.e. Repitition Removed)
tidy_simplified <- lyrics_simplified %>%
  unnest_tokens(word,Lyric) %>%
  anti_join(stop_words_pt)

count_simplified <- tidy_simplified %>%
  count(word,sort=TRUE) %>%
  mutate(word = reorder(word, n)) %>%
  mutate(Simplified = T)

all_counts <- full_join(tidy_count, count_simplified)

all_counts %>%
  group_by(Simplified) %>%
  top_n(20,n) %>%
  ungroup() %>%
  mutate(word = fct_reorder(as.factor(word),n)) %>%
  ggplot(aes(x=word, y = n, fill=Simplified)) +
  geom_col(position='dodge') + 
  scale_fill_geno(palette='Ordem')+
  xlab(NULL) +
  coord_flip()

## Bigrams - simplified
buarque_bigrams <- lyrics_simplified %>%
  unnest_tokens(bigram, Lyric, token = "ngrams", n = 2)

buarque_bigrams %>%
  count(bigram, sort = TRUE)

bigrams_separated <- buarque_bigrams %>%
  separate(bigram, c("word1", "word2"), sep = " ", remove = F)

bigrams_filtered <- bigrams_separated %>%
  filter(!word1 %in% stop_words_pt$word) %>%
  filter(!word2 %in% stop_words_pt$word)

# new bigram counts:
bigram_counts <- bigrams_filtered %>%
  count(word1, word2, sort = TRUE) %>%
  unite(bigram, word1, word2, sep = " ")

bigrams_separated <- bigrams_separated %>% full_join(bigram_counts)

## What if we see which phrases he uses in more than one song (but only count them one time per song?)
bigrams_filtered_per_song <- bigrams_separated %>%
  filter(!word1 %in% stop_words_pt$word) %>%
  filter(!word2 %in% stop_words_pt$word) %>%
  distinct(Song, bigram, word1, word2)

# new bigram counts:
bigram_counts_per_song <- bigrams_filtered_per_song %>%
  count(word1, word2, sort = TRUE) %>%
  unite(bigram, word1, word2, sep = " ")

bigrams_separated_per_song <- bigrams_separated %>% full_join(bigram_counts_per_song)


## TF-IDF
chico_words <- lyrics_simplified %>%
  unnest_tokens(word, Lyric) %>%
  count(Song, word, sort = TRUE) %>%
  ungroup()

total_words <- chico_words %>%
  group_by(Song) %>%
  summarize(total = sum(n)) %>%
  ungroup()

chico_words <- left_join(chico_words, total_words)

chico_words %>%
  filter(Song %in% c('A Banda', 'Mambembe')) %>%
  ggplot(aes(n/total, fill=Song))+
  geom_histogram(show.legend = FALSE, bins = 10) +
  facet_grid(Song~.,scales = 'free_y')+
  scale_fill_geno()

freq_by_rank <- chico_words %>%
  group_by(Song) %>%
  mutate(rank = row_number(),
         `term frequency` = n/total) %>%
  arrange(-`term frequency`)
freq_by_rank

## Bind_Tf_IDF
chico_words <- chico_words %>%
  bind_tf_idf(word,Song,n)

### Sentiment

get_word_sentiment("aurora")
