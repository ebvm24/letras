################################################################################
## Name: scrape_lyrics.R
## Description: Functions to scrape lyrics from letras.musica.
## Author: ebvm
## Date: 2017-10-01
################################################################################

## Libraries
library(lyricScrapeR)

## Site

cartola <- scrape_songs('cartola','https://www.letras.com/cartola/',write_rds=T)
chico_buarque <- scrape_songs('cartola','https://www.letras.com/chico-buarque/', write_rds=T)
gilberto_gil <- scrape_songs('cartola','https://www.letras.com/gilberto-gil/', write_rds=T)
joao_gilberto <- scrape_songs('cartola','https://www.letras.com/joao_gilberto/', writerds=T)
