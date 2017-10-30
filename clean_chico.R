################################################################################
## Name: clean_chico.R
## Description: Clean and Maintain Chico Buarque Song Metadata
## Author: ebvm
## Date: 2017-10-15
################################################################################

library(tidyverse)

all_songs <- readRDS(file = 'chico_buarque_song_list.rds')

# https://en.wikipedia.org/wiki/Chico_Buarque_de_Hollanda_(1966_album)


album_df <- data_frame(Song = names(all_songs),
                       Language = "Portuguese")

## Attach Album Name and Year to Songs by Album

song_list <- list()

## Chico Buarque de Hollanda, Vol 1
song_list$Vol1 <- data_frame(Song = c('A Banda',
                                      'Tem Mais Samba',
                                      'A Rita',
                                      'Ela e Sua Janela',
                                      'Madalena Foi Pro Mar',
                                      'Pedro Pedreiro',
                                      'Amanhã, Ninguém Sabe',
                                      'Você Não Ouviu',
                                      'Juca',
                                      'Olê, Olá',
                                      'Meu Refrão',
                                      'Sonho de Um Carnaval'),
                             Album = 'Chico Buarque de Hollanda',
                             Year = 1966)

# Morte e Vida Severina
song_list$morteevidaseverina <- data_frame(Song = c("De Sua Formosura",
                                                    "Severino/ O Rio",
                                                    "Notícias do Alto Sertão",
                                                    "Mulher Na Janela",
                                                    "Homens de Pedra",
                                                    "Todo o Céu e a Terra",
                                                    "Encontro com o Canavial",
                                                    "Funeral de Um Lavrador",
                                                    "Chegada ao Recife",
                                                    "As Ciganas",
                                                    "Despedida do Agreste",
                                                    "O Outro Recife",
                                                    "Fala do Mestre Carpina"),
                                           Album = 'Morte e Vida Severina',
                                           Year = 1966)


## Chico Buarque de Hollanda, Vol 2
song_list$Vol2 <- data_frame(Song = c("Noite dos Mascarados",
                                      "Logo Eu?",
                                      "Com Açúcar, Com Afeto",
                                      "Fica",
                                      "Lua Cheia",
                                      "Quem Te Viu, Quem Te Vê",
                                      "Realejo",
                                      "Ano Novo",
                                      "A Televisão",
                                      "Será Que Cristina Volta?",
                                      "Morena Dos Olhos D'água",
                                      "Um Chorinho"),
                             Album = 'Chico Buarque de Hollanda vol. 2',
                             Year = 1967)


## Chico Buarque de Hollanda, Vol. 3
song_list$Vol3 <- data_frame(Song = c("Ela Desatinou",
                                      "Retrato Em Branco e Preto",
                                      "Januária",
                                      "Desencontro",
                                      "Carolina",
                                      "Roda Viva",
                                      "O Velho",
                                      "Até Pensei",
                                      "Sem Fantasia",
                                      "Até Segunda-Feira",
                                      "Funeral de Um Lavrador",
                                      "Morte e Vida Severina"),
                             Album = "Chico Buarque de Hollanda vol. 3",
                             Year = 1968)

song_list$umaseoutras <- data_frame(Song = c("Onde É Que Você Estava",
                                             "Umas e Outras",
                                             "Benvinda" ,
                                             "Até Pensei"),
                                    Album = 'Umas e Outras',
                                    Year = 1969)

## Chico Buarque de Hollanda, Vol. 4
song_list$Vol4 <- data_frame(Song = c("Essa Moça Tá Diferente",
                                      "Não Fala de Maria",
                                      "Ilmo Sr. Ciro Monteiro Ou Receita Pra Virar Casaca de Neném",
                                      "Agora Falando Sério",
                                      "Gente Humilde",
                                      "Nicanor",
                                      "Rosa-dos-ventos",
                                      "Samba e Amor",
                                      "Pois é",
                                      "Cara a Cara",
                                      "Mulher, Vou Dizer Quanto Eu Te Amo",
                                      "Tema de \"Os Inconfidentes\""),
                             Album = 'Chico Buarque de Hollanda vol. 4',
                             Year = 1970)


## Construca~o
song_list$construcao <- data_frame(Song = c("Deus Lhe Pague",
                                            "Cotidiano",
                                            "Desalento",
                                            "Construção",
                                            "Cordão",
                                            "Olha Maria",
                                            "Samba de Orly",
                                            "Valsinha",
                                            "Minha História",
                                            "Acalanto"),
                                   Album = 'Construção',
                                   Year = 1971)

## Quando o Carnaval Chegou
song_list$quandoCarnaval <- data_frame(Song = c("Mambembe (Tema de abertura orquestral)" ,
                                                "Baioque" ,
                                                "Caçada",
                                                "Mais Uma Estrela",
                                                "Quando o Carnaval Chegar",
                                                "Minha Embaixada Chegou",
                                                "Soneto (Instrumental)",
                                                "Mambembe",
                                                "Soneto",
                                                "Partido Alto",
                                                "Bom Conselho",
                                                "Frevo",
                                                "Formosa",
                                                "Cantores do Rádio"),
                                       Album = 'Quando o Carnaval Chegar',
                                       Year = 1972)

## Chico Canta
song_list$chicocanta <- data_frame(Song = c("Prólogo",
                                            "Cala a Boca, Bárbara",
                                            "Tatuagem",
                                            "Ana de Amsterdam",
                                            "Bárbara",
                                            "Não Existe Pecado ao Sul do Equador",
                                            "Boi Voador Não Pode",
                                            "Fado Tropical",
                                            "Tira As Mãos de Mim",
                                            "Cobra de Vidro",
                                            "Vence Na Vida Quem Diz Sim",
                                            "Fortaleza"),
                                   Album = 'Chico Canta',
                                   Year = 1973)



song_list$sinalfechado <- data_frame(Song = c("Festa Imodesta",
                                              "Copo Vazio",
                                              "Filosofia",
                                              "O Filho Que Eu Quero Ter",
                                              "Cuidado Com a Outra",
                                              "Lágrima",
                                              "Acorda Amor",
                                              "Ligia",
                                              "Sem Compromisso",
                                              "Você Não Sabe Amar",
                                              "Me Deixe Mudo",
                                              "Sinal Fechado",
                                              "Samba Para Vinícius"),
                                     Album = 'Sinal Fechado',
                                     Year = 1974)

song_list$meuscarosamigos <- data_frame(Song = c("O Que Será (À Flor da Terra)",
                                                 "Mulheres de Atenas",
                                                 "Olhos Nos Olhos",
                                                 "Você vai me Seguir",
                                                 "Vai Trabalhar Vagabundo",
                                                 "Corrente",
                                                 "A Noiva da Cidade",
                                                 "Passaredo",
                                                 "Basta Um Dia",
                                                 "Meu Caro Amigo"),
                                        Album = 'Meus Caros Amigos',
                                        Year = 1976)


## Os Saltimbancos
song_list$os_saltimbancos <- data_frame(Song = c("Bicharia",
                                                 "O Jumento",
                                                 "Um Dia de Cão",
                                                 "A Galinha",
                                                 "História de Uma Gata",
                                                 "A Cidade Ideal",
                                                 "Minha Canção",
                                                 "A Pousada do Bom Barão",
                                                 "A batalha",
                                                 "Todos Juntos",
                                                 "Esconde-esconde",
                                                 "Todos Juntos (reprise)",
                                                 "Bicharia (reprise)"),
                                        Album = 'Os Saltimbancos',
                                        Year = 1977)

song_list$francisco <- data_frame(Song = c("O Velho Francisco",
                                           "As Minhas Meninas" ,
                                           "Uma Menina",
                                           "Estação Derradeira",
                                           "Bancarrota Blues",
                                           "Ludo Real",
                                           "Todo o Sentimento",
                                           "Lola",
                                           "Cadê Você",
                                           "Cantando No Toró"),
                                  Album = 'Francisco',
                                  Year = 1977)

# Chico Buarque 1978
song_list$chicobuarque1978 <- data_frame(Song = c("Feijoada Completa",
                                                  "Cálice",
                                                  "Trocando Em Miúdos",
                                                  "O Meu Amor",
                                                  "Homenagem Ao Malandro",
                                                  "Até o Fim",
                                                  "Pedaço de Mim",
                                                  "Pivete",
                                                  "Pequeña Serenata Diurna",
                                                  "Tanto Mar",
                                                  "Apesar de Você"),
                                         Album = 'Chico Buarque',
                                         Year = 1978)

song_list$operadomalandro1979 <- data_frame(Song = c("O Malandro",
                                                     "Hino de Duran",
                                                     "Viver do Amor",
                                                     "Uma Canção Desnaturada",
                                                     "Tango do Covil",
                                                     "Doze Anos",
                                                     "O Casamento Dos Pequenos Burgueses",
                                                     "Teresinha",
                                                     "Homenagem Ao Malandro",
                                                     "Folhetim",
                                                     "Ai, Se Eles Me Pegam Agora",
                                                     "O Meu Amor",
                                                     "Se Eu Fosse Teu Patrão",
                                                     "Geni e o Zepelim",
                                                     "Pedaço de Mim",
                                                     "Ópera",
                                                     "O Malandro 2"),
                                            Album = 'Ópera do Malandro',
                                            Year = '1979')


song_list$vida <- data_frame(Song = c("Vida",
                                      "Mar e Lua",
                                      "Deixe a Menina",
                                      "Já Passou",
                                      "Bastidores",
                                      "Qualquer Canção",
                                      "Fantasia",
                                      "Eu Te Amo",
                                      "De Todas as Maneiras",
                                      "Morena de Angola",
                                      "Bye, Bye, Brasil",
                                      "Não Sonho Mais"),
                             Album = 'Vida',
                             Year = 1980)

song_list$almanaque <- data_frame(Song = c("As Vitrines",
                                           "Ela É Dançarina",
                                           "O Meu Guri",
                                           "A Voz do Dono e o Dono da Voz",
                                           "Almanaque",
                                           "Tanto Amar",
                                           "Angélica",
                                           "Moto-contínuo",
                                           "Amor Barato"),
                                  Album = 'Almanaque',
                                  Year = 1981)

song_list$saltimbancostrapalhoes <- data_frame(Song = c("Piruetas",
                                                        "Hollywood",
                                                        "Alô, Liberdade",
                                                        "A Cidade Dos Artistas",
                                                        "História de Uma Gata",
                                                        "Rebichada",
                                                        "Minha Canção",
                                                        "Meu Caro Barão",
                                                        "Todos Juntos"),
                                               Album = 'Saltimbancos Trapalhoes',
                                               Year = 1981)

song_list$paravivergrandeamor <- data_frame(Song = c("Samba do Carioca",
                                                     "Sabe Você", 
                                                     "Sinhazinha (Despertar)",
                                                     "Desejo",
                                                     "A Violeira",
                                                     "Imagina",
                                                     "Tanta Saudade",
                                                     "A primavera",
                                                     "Sinhazinha (Despedida)",
                                                     "Samba do Grande Amor",
                                                     "Meninos, Eu Vi"),
                                            Album = 'Para Viver Grande Amor',
                                            Year = 1983)

song_list$ograndecirco <- data_frame(Song = c("Abertura do circo (Instrumental)",
                                              "Beatriz",
                                              "Valsa Dos Clowns",
                                              "Opereta do Casamento",
                                              "A História de Lily Braun",
                                              "Oremus",
                                              "Meu Namorado",
                                              "Ciranda da Bailarina",
                                              "Sobre Todas As Coisas",
                                              "O Tatuador (Instrumental)",
                                              "A Bela e a Fera",
                                              "O Circo Místico",
                                              "Na Carreira"),
                                     Album = 'O Grande Circo Místico',
                                     Year = 1983)

song_list$chicobuarque1984 <- data_frame(Song = c("Pelas Tabelas",
                                                  "Brejo da Cruz",
                                                  "Tantas Palavras",
                                                  "Mano a Mano",
                                                  "Samba do Grande Amor",
                                                  "Como Se Fosse a Primavera",
                                                  "Suburbano Coração",
                                                  "Mil Perdões",
                                                  "As Cartas",
                                                  "Vai Passar"),
                                         Album = 'Chico Buarque',
                                         Year = 1984)

song_list$ocorsariodorei <- data_frame(Song = c("Verdadeira Embolada",
                                                "Show Biz",
                                                "A Mulher de Cada Porto",
                                                "Opereta do Moribundo",
                                                "Bancarrota Blues",
                                                "Tango de Nancy",
                                                "Choro Bandido",
                                                "Salmo",
                                                "Acalanto",
                                                "O Corsário do Rei",
                                                "Meia-noite"),
                                       Album = 'O Corsário do Rei', 
                                       Year = 1985)

song_list$malandro <- data_frame(Song = c("A Volta do Malandro",
                                          "Las Muchachas de Copacabana",
                                          "Hino da Repressão",
                                          "O Último Blues",
                                          "Tango do Covil",
                                          "Sentimental",
                                          "Aquela Mulher",
                                          "Palavra de Mulher",
                                          "Hino da repressão ",
                                          "Rio 42"),
                                 Album = 'Malandro',
                                 Year = 1985)


song_list$operadomalandro <- data_frame(Song = c("A Volta do Malandro",
                                                 "Las Muchachas de Copacabana",
                                                 "Tema de Geni",
                                                 "Hino da Repressão",
                                                 "Aquela Mulher",
                                                 "Viver do Amor",
                                                 "Sentimental",
                                                 "Desafio do Malandro",
                                                 "O Último Blues",
                                                 "Palavra de Mulher",
                                                 "O Meu Amor",
                                                 "Tango do Covil",
                                                 "Uma Canção Desnaturada",
                                                 "Rio 42",
                                                 "Pedaço de Mim"),
                                        Album = 'Ópera do Malandro',
                                        Year = 1986)

song_list$francisco <- data_frame(Song = c("O Velho Francisco",
                                           "As Minhas Meninas",
                                           "Uma Menina",
                                           "Estação Derradeira",
                                           "Bancarrota Blues",
                                           "Ludo Real",
                                           "Todo o Sentimento",
                                           "Lola",
                                           "Cadê Você",
                                           "Cantando No Toró"),
                                  Album = 'Francisco',
                                  Year = 1987)


song_list$dancadameialua <- data_frame(Song = c("Abertura",
                                                "Casa de João de Rosa",
                                                "A Permuta Dos Santos",
                                                "Frevo Diabo",
                                                "Meio-dia Meia-lua",
                                                "Abandono",
                                                "Dança das Máquinas",
                                                "Tablados",
                                                "Tororó",
                                                "Sol e Chuva",
                                                "Valsa Brasileira",
                                                "Pas de Deux"),
                                       Album = 'Dança da Meia-Lua',
                                       Year = 1988)

# Chico Buarque 1989
song_list$chicobuarque1989 <- data_frame(Song = c("Morro Dois Irmãos",  	 	 
                                                  "Trapaças",  	 	 
                                                  "Na Ilha de Lia, No Barco de Rosa (Meio-Dia, Meia-Lua)",  	 	 
                                                  "Baticum",  	 	 
                                                  "A Permuta dos Santos",  	 	 
                                                  "O Futebol",  	 	 
                                                  "A Mais Bonita",  	 	 
                                                  "Uma Palavra",  	 	 
                                                  "Tanta Saudade",  	 	 
                                                  "Valsa Brasileira"),
                                         Album = 'Chico Buarque',
                                         Year = 1989)

song_list$paratodos <- data_frame(Song = c("Paratodos",
                                           "Choro Bandido",
                                           "Tempo e Artista",
                                           "De Volta Ao Samba",
                                           "Sobre Todas As Coisas",
                                           "Outra Noite",
                                           "Biscate",
                                           "Romance",
                                           "Futuros Amantes",
                                           "Piano na Mangueira",
                                           "Pivete",
                                           "A Foto da Capa"),
                                  Album = 'Paratodos',
                                  Year = 1993)

song_list$umapalavra <- data_frame(Song = c("Estação Derradeira",
                                            "Morro Dois Irmãos",
                                            "Ela É Dançarina",
                                            "Samba e Amor",
                                            "A Rosa",
                                            "Joana Francesa",
                                            "O Futebol",
                                            "Ela Desatinou",
                                            "Quem Te Viu, Quem Te Vê",
                                            "Pelas Tabelas",
                                            "Eu Te Amo",
                                            "Valsa Brasileira",
                                            "Amor Barato",
                                            "Vida",
                                            "Uma Palavra"),
                                   Album = 'Uma Palavra',
                                   Year = 1995)


song_list$terra <- data_frame(Song = c("Assentamento",
                                       "Brejo da Cruz",
                                       "Levantados do Chão",
                                       "Fantasia"),
                              Album = 'Terra',
                              Year = 1997)


song_list$ascidades <- data_frame(Song = c(	"Carioca",
                                            "Iracema Voou",
                                            "Sonhos Sonhos São",
                                            "A Ostra e o Vento",
                                            "Xote de Navegação",
                                            "Você, Você (Canção Edipiana)",
                                            "Assentamento",
                                            "Injuriado",
                                            "Aquela Mulher",
                                            "Cecília",
                                            "Chão de Esmeraldas"),
                                  Album = 'As Cidades',
                                  Year = 1998)

song_list$cambaiao <- data_frame(Song = c("Cambaio",
                                          "Uma Canção Inédita",
                                          "Lábia",
                                          "A Moça do Sonho",
                                          "Ode Aos Ratos",
                                          "Quase Memória",
                                          "Veneta",
                                          "Noite de Verão",
                                          "A Fábrica",
                                          "Cantiga de Acordar"),
                                 Album = 'Cambaiao',
                                 Year = 2001)

song_list$chico <- data_frame(Song = c("Querido Diário",
                                       "Rubato",
                                       "Essa Pequena",
                                       "Tipo Um Baião",
                                       "Se Eu Soubesse (part. Thais Gulin)",
                                       "Sem Você",
                                       "Sou Eu",
                                       "Nina",
                                       "Barafunda",
                                       "Sinhá"),
                              Album = 'Chico',
                              Year = 2011)

song_list$caravanas <- data_frame(Song = c("Tua Cantiga",
                                           "Blues Para Bia",
                                           "A Moça do Sonho",
                                           "Jogo De Bola",
                                           "Massarandupió",
                                           "Dueto",
                                           "Casualmente",
                                           "Desaforos",
                                           "As Caravanas"),
                                  Album = 'Caravanas',
                                  Year = 2017)

wiki <- do.call(rbind.data.frame,song_list) %>%
  group_by(Song) %>%
  top_n(-1,Year) %>% 
  ungroup()

album_df <- album_df %>%
  right_join(wiki)
  

### Identify Language ##########################################################

span <- c('Mar Y Luna',
          "Mambembe (en Español)", 
          "Cotidiano (en Español)",
          "Construcción",
          "Apesar de Usted",
          "Acalanto (en Español)")
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
          "C'è Più Samba",
          "Pedro Pedreiro (Italiano)",
          "Olê, Olá (Italiano)",
          "Carolina (Italiano)",
          "Juca (Italiano)",
          "Samba e Amore")

album_df[album_df$Song %in% span,'Language'] <- 'Spanish'
album_df[album_df$Song %in% ital,'Language'] <- 'Italian'
album_df[album_df$Song %in% fren, 'Language'] <- 'French'

album_df %>% write_csv('chico_buarque_album_df.csv')

rm(list = ls())