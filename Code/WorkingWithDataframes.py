#Questo file conterrà il codice in python utilizzato per creare grafi dai dataframe ricavati nel codice in R
import matplotlib.pyplot as plt

import io

import numpy as np

import pandas as pd

import cufflinks as cf

import plotly
import plotly.graph_objs as go

import matplotlib.pyplot as plt

from IPython.display import display

import re

import sklearn
from sklearn.model_selection import train_test_split

import wordcloud
from wordcloud import WordCloud, STOPWORDS

import nltk
#nltk.download()
from nltk.tokenize import RegexpTokenizer
from nltk.corpus import stopwords
from nltk.classify import SklearnClassifier

from subprocess import check_output

from plotnine import * 
#%matplotlib inline


'''

# PEZZO DI CODICE PER CREAZIONE DEL WORDCLOUD
#WORDCLOUD
ttoadf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\ttoa.csv")

data = ttoadf[['tweet_text','Sentiment']]

#split del dataset in trai e test
train,test = train_test_split(data, test_size = 0.1)

#rimozione sentimenti neutrali
train = train[train.Sentiment != "neutral"]

train_pos = train[ train['Sentiment'] == 'positive']
train_pos_text = train_pos['tweet_text']

train_neg = train[ train['Sentiment'] == 'negative']
train_neg_text = train_neg['tweet_text']

def wordcloud_draw(data, color = 'black'):
    words = ' '.join(data)
    cleaned_word = " ".join([word for word in words.split()
                      if 'http' not in word
                      and not word.startswith('@')
                      and not word.startswith('#')
                      and word != 'RT'])
    wordcloud = WordCloud(stopwords=STOPWORDS,
                          background_color = color,
                          width=2500,
                          height=2500).generate(cleaned_word)
    plt.figure(1, figsize=(13,13))
    plt.imshow(wordcloud)
    plt.axis('off')
    plt.show()

print("Positive words")
wordcloud_draw(train_pos_text, 'white')
print("Negative words")
wordcloud_draw(train_neg_text, 'black')
'''

'''
# plot a bipartite graph of the network
import networkx as nx
ttoadf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\ttoa.csv")

#plot line chart with sentiments over time from dataset
ttoadf['date'] = pd.to_datetime(ttoadf['date'])
plt.show(ttoadf.groupby('date')['Sentiment'].value_counts().unstack().plot())

#sentiment analysis of ttdf dataset
import textblob
from textblob import TextBlob
ttdf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\tt.csv", dtype = {'created_at':'str'}, low_memory=False )
ttdf['full_text'] = ttdf['full_text'].astype(str)
ttdf['Sentiment'] = ttdf['full_text'].apply(lambda tweet: TextBlob(tweet).sentiment.polarity)
ttdf['Sentiment'] = ttdf['Sentiment'].apply(lambda x: 'positive' if x > 0 else ('negative' if x < 0 else 'neutral'))
plt.show()
#ttdf.to_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\ttdf.csv", index=False)

import textblob
from textblob import TextBlob
ttdf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\tt.csv", dtype = {'created_at':'str'}, low_memory=False )

ttdf['full_text'] = ttdf['full_text'].astype(str)
ttdf['Sentiment'] = ttdf['full_text'].apply(lambda tweet: TextBlob(tweet).sentiment.polarity)
ttdf['Sentiment'] = ttdf['Sentiment'].apply(lambda x: 'positive' if x > 0 else ('negative' if x < 0 else 'neutral'))
'''

import matplotlib.pyplot as plt
ttpydf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\ttpyNoCol.csv", low_memory=False )

# plot a 3 line chart with sentiments from ttpydf dataset and reduce the y values
ttpydf['date'] = pd.to_datetime(ttpydf['created_at']).dt.date
#plt.show(ttpydf.groupby('date')['Sentiment'].value_counts().unstack().plot())
plt.show(ttpydf.groupby('date')['Sentiment'].value_counts().unstack().plot())
#clean the ylabel of the previous plot
 