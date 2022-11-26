#librerie incluse per poter lavorare con i dati e i file

library(twitteR)
library(writexl)
library(readxl)
library(openxlsx)
library(writexl)
library(ggplot2)
library(tidyverse)
library(igraph)
library(dplyr)
library(dbplyr)
library(rtweet)
library(tidytext)
library(dplyr)
library(rjson)
library(syuzhet)


#chiavi fornite da twitter per accedere all'API
consumer_key <- "VI1W3qB5fCYvq3MO9vBC9CdH7"
consumer_secret <- "DGrrha8SFhA6smYT8ua3PhIOyOhuH4ZyVHY5hA9fDXVjPPUp5m"
access_token <- "750009430540943360-ca6slbZtRmcuOsfYmFxoIHAPQBDbVb1"
access_secret <- "PHEy4UyQtTUParRDbBJG6DvIUHBpkVUZOhYV2z1VXgSo0"

#creazione auth per la libreria twitteR
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


#primo test per verificare il funzionamento dei comani
tw1 <- twitteR::searchTwitter('activists', n = 10000)
d2 <- twitteR::twListToDF(tw1)

#dopo aver prelevato i tweet il dataframe verrà salvato sottoforma di file excel
write_xlsx(d2, "oilactivists.xlsx")

#creazione token per poter utilizzare i comandi della libreria rtweet

twitter_token <- rtweet::create_token(
  app = AccessingTwitterData,
  consumer_key = consumer_key,
  consumer_secret = consumer_secret,
  access_token = access_token,
  access_secret = access_secret
)

#prime raccolte di tweet tramite la libreria rtweet
#raccolgo i tweet
test_activism_1 <- rtweet::search_tweets("activists OR climate activists", n= 18000, retryonratelimit = TRUE)
test_activism_2 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE)
test_activism_3 <- rtweet::search_tweets("just stop oil OR Just Stop Oil OR activists OR climate activists OR just stop oil protest", n= 18000, retryonratelimit = TRUE)
test_activism_4 <- rtweet::search_tweets("#Lastgeneration OR #LastGeneration OR #lastgeneration OR Last generation OR Last Generation OR last generation", n= 18000, retryonratelimit = TRUE, lang = "en")

#tutti i file excel verranno salvati all'interno della cartella documents

#salvataggio dei file xslx
write_xlsx(test_activism_1, "activism.xlsx")
write_xlsx(test_activism_2, "activism1.xlsx")
write_xlsx(test_activism_3, "activism2.xlsx")
write_xlsx(test_activism_4, "activism3.xlsx")

#dopo aver confermato il funzionamento del codice i dataframe verranno salvati in modo più ordinato
#verranno denominati data_frame_[numero di raccolte del giorno]_[giorno/mese/anno]
#per esempio la prima raccolta non avrà nessun numero e la seconda sarà seguita da un 1
#i dataframe verranno poi salvati in un file excel con lo stesso nome per evitare confusioni
#cercheremo di effettuare delle raccolte in modo regolare per poter raccogliere il maggior numero di informazioni

#29/10/2022
data_frame_29102022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_29102022, "data_frame_29102022.xlsx")

data_frame_1_29102022 <- rtweet::search_tweets("#LastGeneration OR #lastgeneration", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_1_29102022, "data_frame_1_29102022.xlsx")

#31/10/2022
data_frame_31102022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_31102022, "data_frame_31102022.xlsx")

#01/11/2022
data_frame_01112022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_01112022, "data_frame_01112022.xlsx")

data_frame_1_01112022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_1_01112022, "data_frame_1_01112022.xlsx")

data_frame_2_01112022 <- rtweet::search_tweets("climate activists OR oil activists ", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_2_01112022, "data_frame_2_01112022.xlsx")

#02/11/2022
data_frame_02112022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil OR oil activists OR climate crisis", n = 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_02112022, "data_frame_02112022.xlsx")

data_frame_1_02112022 <- rtweet::search_tweets("climate activists", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_1_02112022, "data_frame_1_02112022.xlsx")

data_frame_2_02112022 <- rtweet::search_tweets("climate activists", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_2_02112022, "data_frame_2_02112022.xlsx")

#03/11/2022
data_frame03112022 <- rtweet::search_tweets("just stop oil OR Just Stop Oil", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame03112022, "data_frame03112022.xlsx")
#ho mancato un underscore

data_frame_1_03112022 <- rtweet::search_tweets("oil activists OR climate activists", n= 18000, retryonratelimit = TRUE) # nolint
write_xlsx(data_frame_1_03112022, "data_frame_1_03112022.xlsx")

#test per trasformare un data frame di search_tweets in un file json
test_activism_1_json <- toJSON(test_activism_1)
write(test_activism_1_json, "test_activism_1_json.json")

#04/11/2022
#test con molteplici hashtag
hashtags <- c("#JustStopOil", "#ClimateCrisis", "#LastGeneration",
              "#juststopoil", "#lastgeneration", "#climatecrisis",
              "#ClimateActivists","Climate activists", "climate activists", "climate activists",
              "just stop oil", "Just Stop Oil", "Klimt", "Gustav Klimt"
              )
#il metogo di includere vari hashtag e parole chiave non funziona molto bene dato che preleva pochi tweet

search <- paste(hashtags, collapse = " OR ")

#aumentato il numero di tweet da raccogliere a 20000

data_frame_04112022 <- rtweet::search_tweets(search, n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_04112022, "data_frame_04112022.xlsx")

#danneggiato un quadro di van gogh esposto a roma

data_frame_1_04112022 <- rtweet::search_tweets("Van Gogh", n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_04112022, "data_frame_1_04112022.xlsx") 
#nel file xlsx è stato salvato il dataframe data_frame_04112022 a causa di un errore di battitura

#05/11/2022
data_frame_05112022 <- rtweet::search_tweets(search, n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_05112022, "data_frame_05112022.xlsx")

#utilizzo anche parole chiave per raccogliere più tweet
data_frame_1_05112022 <- rtweet::search_tweets("Oil Activists OR oil activists", n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_05112022, "data_frame_1_05112022.xlsx")

#06112022
data_frame_06112022 <- rtweet::search_tweets("Oil Activists OR oil activists OR Just stop oil", n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_06112022, "data_frame_06112022.xlsx")

#07112022
data_frame_07112022 <- rtweet::search_tweets(search, n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_07112022, "data_frame_07112022.xlsx")

#08112022
data_frame_08112022 <- rtweet::search_tweets(search, n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_08112022, "data_frame_08112022.xlsx")


data_frame_1_08112022 <- rtweet::search_tweets("Oil Activists OR oil activists", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_08112022, "data_frame_1_08112022.xlsx")


#09112022
data_frame_09112022 <- rtweet::search_tweets(search, n = 20000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_09112022, "data_frame_09112022.xlsx")

#10112022
data_frame_10112022 <- rtweet::search_tweets(search, n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_10112022, "data_frame_10112022.xlsx")

#11112022
data_frame_11112022 <- rtweet::search_tweets(search, n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_11112022, "data_frame_11112022.xlsx")

#12112022
#nessun data raccolto

#13112022
data_frame_12112022 <- rtweet::search_tweets(search, n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_12112022, "data_frame_13112022.xlsx")
#sbagliato a scrivere il nome del dataframe, dovrebbe essere 13112022
data_frame_13112022 <- data_frame_12112022


#15112022
data_frame_15112022 <- rtweet::search_tweets("Klimt OR Gustav Klimt", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_15112022, "data_frame_15112022.xlsx")

#riguardare parole chiave per gustav klimt
data_frame_1_15112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_15112022, "data_frame_1_15112022.xlsx")

#16112022
data_frame_16112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_16112022, "data_frame_16112022.xlsx")

data_frame_1_16112022 <- rtweet::search_tweets("Just Stop Oil OR just stop oil", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_16112022, "data_frame_1_16112022.xlsx")

#17112022
data_frame_17112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_17112022, "data_frame_17112022.xlsx")

#18112022
data_frame_18112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_18112022, "data_frame_18112022.xlsx")

#20112022
data_frame_20112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_20112022, "data_frame_20112022.xlsx")

#21112022
data_frame_21112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_21112022, "data_frame_21112022.xlsx")

#23112022
data_frame_23112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_23112022, "data_frame_23112022.xlsx")

#24112022
data_frame_24112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_24112022, "data_frame_24112022.xlsx")

data_frame_1_24112022 <- rtweet::search_tweets("Just Stop Oil OR just stop oil", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_1_24112022, "data_frame_1_24112022.xlsx")

#27112022
data_frame_27112022 <- rtweet::search_tweets("Climate activists OR climate activists OR climate activist OR Just Stop Oil", n = 18000, retryonratelimit = TRUE) #nolint
write_xlsx(data_frame_27112022, "data_frame_27112022.xlsx")

#test grafo con il dataframe activism
activism <- read_excel("C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\DataFrames\\.xlsx\\activism_no_duplicates.xlsx")
activism_data = data.frame(activism)
review_activism <- as.character(activism_data)

s1 <- get_nrc_sentiment(review_activism)
view(s1)

#barplot con emotioni del file activism
barplot(colSums(s1), col = rainbow (10), ylab = 'Number of tweets', main = 'Users feedback')

#test con un altro plot
#importare il data set
df <- read.csv("C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\DataFrames\\.csv\\activism_no_duplicates.csv")
text.df <- as.character(df)

#analizzare sentimenti usando syuzhet
emotions <- get_nrc_sentiment(text.df)
emo_bar <- colSums(emotions)
emo_sum <- data.frame(count=emo_bar, emotion=names(emo_bar))

#ggplot
ggplot(emo_sum, aes(x = reorder(emotion, -count), y= count)) + geom_bar(stat="Identity")

#test con tidytext package
bing_world_counts <- text.df %>% unnest_tokens(output = word, input = text) %>% inner_join(get_sentiments("bing")) %>% count(word, sentiment, sort = TRUE)
