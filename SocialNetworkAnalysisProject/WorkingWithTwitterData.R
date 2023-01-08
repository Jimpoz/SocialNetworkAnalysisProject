library(ggfortify)
library(stats)
library(Rtsne)
library(cluster)
library(ISLR)
library(twitteR)
library(ROAuth)
library(hms)
library(lubridate) 
library(tidytext)
library(tm)
library(wordcloud)
library(igraph)
library(glue)
library(networkD3)
library(rtweet)
library(plyr)
library(stringr)
library(ggplot2)
library(ggeasy)
library(plotly)
library(dplyr)
library(hms)
library(lubridate)
library(magrittr)
library(tidyverse)
library(janeaustenr)
library(widyr)
library(readxl)
library(writexl)

#Lettura di un file excel e trasformato in un dataframe
tweetdatand <- read_xlsx("C:\\Users\\Jimpo\\Documents\\TweetRaccolitNoDuplicati.xlsx")
tweets_nd_df <- data.frame(tweetdatand)

#test del plot
plot(x = tweetdatand$retweet_count, y = tweetdatand$id,
     xlab = "Retweet count",
     ylab = "id",
     main = "tweets with highest retweets"
)

barplot(tweetdatand$retweet_count,# y = tweetdatand$id,
     xlab = "Retweet count",
     main = "tweets with highest retweets",
     #horiz = TRUE,
     ylim = c(0,250000),
     xlim = c(0,100000) 
)

#Plot che mostra il numero di tweet per ora

plot(ylab="", x=table(tweetdatand$created_at), ylim = c(0,30))

#SENTIMENT ANALYSIS DA CAPIRE COME STRUTTURARE

#Sentiment analysis fatto prima su excel per analizzare lo score di ogni tweet
#il sentiment analysis di excel ha limiti per numero di tweet che può analizzare (max 25mb)

text_only_sentiment <- read_xlsx("C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\TweetTextOnlyAnalysis.xlsx")
text_only_sentiment_df <- data.frame(text_only_sentiment)

#il plst ha limiti di dimensioni quindi bisogna settarli manualmente altrimenti ritorna errori come missing values oppure NA
#trovare quanti sono le ricorrenze dei sentimenti
positive_texts <- sum(text_only_sentiment_df$Sentiment == "positive")
negative_texts <- sum(text_only_sentiment_df$Sentiment == "negative")
neutral_texts <- sum(text_only_sentiment_df$Sentiment == "neutral")

#esempio di barblot per raccogliere i sentimenti positivi, negativi e neutri per poi paragonare la differenza
#l'algoritmo non essendo perfetto può presentare alcuni errori

bars <- c(positive_texts, neutral_texts, negative_texts)

barplot(bars, ylim=c(0,250000), names.arg=c("Positive", "Neutral", "Negative"), main = "Emotions", col=c("green", "grey", "red"))

#Mostrare il grafico del numero di ricorrenze per ogni Score
#la funzione xaxt = 'n' rimuove i valori dall'asse delle x

#Creazione del plot

plot(
     xaxt="n",
     xlab = "Sentiment Score",
     ylab = "",
     x=table(text_only_sentiment$Score),
     main = "Number of Occurrences"
     )

#Modifico i valori dell'asse x per evitare confusioni nella lettura del grafico
# las=1 mostra i valori in orizzontale
# las=2 mostra i valori in verticale
axis(1, xaxp=c(0.001,1.000,2), las=1)

#dati ricavati tramite il sentiment analysis di excel ossia Azure Machine Learning
#lo strumento add-in non risulta molto affidabile quindi il grafico di questi dati è una rappresentazione imprecisa dei dati
#i dati con cui abbiamo lavorato contengono tutti i tweet che discutono del tema
#creazione dataframe che contenga tweet riguardanti il movimento Just Stop Oil oppure The Last Generation oppure gli attacchi alle opere d'arte

#per evitare di creare conflitti con troppi OR creeremo più dataframe per poi unirli
tweets_regarding_movement <- tweetdatand[grep("#JustStopOil", tweetdatand$full_text),]
tweets_regarding_movement_1 <- tweetdatand[grep("Just Stop Oil", tweetdatand$full_text),]
tweets_regarding_movement_2 <- tweetdatand[grep("#VanGogh", tweetdatand$full_text),]
tweets_regarding_movement_3 <- tweetdatand[grep("#ClaudeMonet", tweetdatand$full_text),]
tweets_regarding_movement_4 <- tweetdatand[grep("#Monet", tweetdatand$full_text),]
tweets_regarding_movement_5 <- tweetdatand[grep("#LastGeneration", tweetdatand$full_text),]
tweets_regarding_movement_6 <- tweetdatand[grep("paint", tweetdatand$full_text),]

#combinare vari dataframe direttamente in r sembra non funzionare quindi convertirli prima in file excel per poi fare il merge
write_xlsx(tweets_regarding_movement, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement.xlsx")
write_xlsx(tweets_regarding_movement_1, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_1.xlsx")
write_xlsx(tweets_regarding_movement_2, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_2.xlsx")
write_xlsx(tweets_regarding_movement_3, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_3.xlsx")
write_xlsx(tweets_regarding_movement_4, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_4.xlsx")
write_xlsx(tweets_regarding_movement_5, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_5.xlsx")
write_xlsx(tweets_regarding_movement_6, "C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\tweets_regarding_movement_6.xlsx")

#controllare con le view i dataframe ricavati

#Riprovare sentiment analysis tramite strumenti di R