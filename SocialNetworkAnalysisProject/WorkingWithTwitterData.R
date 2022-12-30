install.packages("ROAuth")
install.packages("tm")
install.packages("wordcloud")
install.packages("networkD3")
install.packages("plyr")
install.packages("ggeasy")
install.packages("plotly")
install.packages("widyr")
install.packages("magrittr")
install.packages("ISLR")
install.packages("cluster")
install.packages("Rtsne")
install.packages("stats")
install.packages("ggfortify")

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


#Converte file excel in un data frame
tweetdata <- read_xlsx("C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\TweetTotali.xlsx")
view(tweetdata)

tweetsdf <- data.frame(tweetdata)

tweetdatand <- read_xlsx("C:\\Users\\Jimpo\\Documents\\TweetRaccolitNoDuplicati.xlsx")
tweets_nd_df <- data.frame(tweetdatand)
view(tweets_nd_df)

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
#SENTIMENT ANALYSIS DA CAPIRE COME STRUTTURARE

#positive = scan('resources/twitter_sentiment_analysis/positive-words.txt', what = 'character', comment.char = ';')
#negative = scan('resources/twitter_sentiment_analysis/negative-words.txt', what = 'character', comment.char = ';')

# add your list of words below as you wish if missing in above read lists
pos.words = c(positive,'upgrade','Congrats','prizes','prize','thanks','thnx',
              'Grt','gr8','plz','trending','recovering','brainstorm','leader')
neg.words = c(negative,'wtf','wait','waiting','epicfail','Fight','fighting',
              'arrest','no','not')

# barplot che mostra le parole più usate, da capire come usare
barplot(tweets_nd_df[1:5]$text, las =2, names.arg = tweets_nd_df[1:5]$text, col="blue", main="Most frequent words", ylab ="Word frequencies")

# create un nuovo dataframe che contenga solo i testi dei tweet
textdf <- (tweets_nd_df$text)

#view(textdf) mostra solo le prime 1000 righe
utils::View(textdf)

#ritorna NA (not available) forse un problema di overflow cauasto dalla quantità di tweet
#    o forse causato dalla somma di altri NA
#da correggere
climate <- sum(str_detect(textdf, 'dumb'))

#anche rimuovendo il limite di stampa non mostra nessun valore perché viene salvato come NA
utils::View(climate)
options(max.print=99999999)
print(climate)

sum(str_detect(textdf, ""))

#Sentiment analysis fatto prima su excel per analizzare l'indice di ogni tweet
#il sentiment analysis di excel ha limiti per numero di tweet che può analizzare (max 25mb)

text_only_sentiment <- read_xlsx("C:\\Users\\Jimpo\\Desktop\\SocialNetworkProject\\TweetTextOnlyAnalysis.xlsx")
text_only_sentiment_df <- data.frame(text_only_sentiment)

sentimenti <- c(text_only_sentiment$Sentiment)
testo_tweet <- c(text_only_sentiment$tweet_text)

is.na(sentimenti)

na.omit(sentimenti)
na.omit(testo_tweet)

utils::View(sentimenti)
utils::View(testo_tweet)

view(text_only_sentiment_df)

#il plost ha limiti di dimensioni quindi bisogna settarli manualmente altrimenti ritorna errori come missing values oppure NA
plot(x = sentimenti, y = testo_tweet, xlim = c(0,540210), ylim = c(0,540210),
     xlab = "Sentimenti", ylab = "Numero")

#trovare quanti sono le ricorrenze dei sentimenti
positive_texts <- sum(text_only_sentiment_df$Sentiment == "positive")
negative_texts <- sum(text_only_sentiment_df$Sentiment == "negative")
neutral_texts <- sum(text_only_sentiment_df$Sentiment == "neutral")

#controllare il numero di ognuno
positive_texts
negative_texts
neutral_texts

#esempio di barblot per raccogliere i sentimenti positivi, negativi e neutri per poi paragonare la differenza
#l'algoritmo non essendo perfetto può presentare alcuni errori

bars <- c(positive_texts, neutral_texts, negative_texts)

barplot(bars, ylim=c(0,250000), names.arg=c("Positive", "Neutral", "Negative"))

#dati ricavati tramite il sentiment analysis di excel ossia Azure Machine Learning
#lo strumento add-in non risulta molto affidabile quindi il grafico di questi dati è una rappresentazione imprecisa dei dati

#riprovare sentiment analysis tramite strumenti di R


counter <- function(){
     sent_score <- text_only_sentiment$Score
     temp=0
     numbers
     for(i in 0.001:1.000){
          for(j in 1:sent_score){
               if(sent_score[j]==i){
                    temp <- temp+1;
               }
               numbers <- append(temp);
          }
     }
}

ggplot(data=text_only_sentiment, mapping = aes(x=text_only_sentiment$Score, y = text_only_sentiment$tweet_text))

