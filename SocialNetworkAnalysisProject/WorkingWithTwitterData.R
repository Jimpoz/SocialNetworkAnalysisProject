install.packages("ROAuth")
install.packages("tm")
install.packages("wordcloud")
install.packages("networkD3")
install.packages("plyr")
install.packages("ggeasy")
install.packages("plotly")
install.packages("widyr")
install.packages("magrittr")

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
plot(x = tweetdatand$retweet_count,y = tweetdatand$id,
     xlab = "Retweet count",
     ylab = "id",
     main = "tweets with highest retweets"
)

#SENTIMENT ANALYSIS DA CAPIRE COME STRUTTURARE

#positive = scan('resources/twitter_sentiment_analysis/positive-words.txt', what = 'character', comment.char = ';')
#negative = scan('resources/twitter_sentiment_analysis/negative-words.txt', what = 'character', comment.char = ';')

positive <- scan()

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