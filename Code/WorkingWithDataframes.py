#Questo file conterrà il codice in python utilizzato per creare grafi dai dataframe ricavati nel codice in R
import matplotlib.pyplot as plt

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

ttdf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\ttoa.csv")
#display(TweetsXLSX)

data = ttdf[['tweet_text','Sentiment']]

#pezzo di codice per creare un wordcloud

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


"""
TweetsXLSX['full_text'] = TweetsXLSX['full_text'].astype(str).str.lower()

regexp = RegexpTokenizer('\w+')

TweetsXLSX['text_token'] = TweetsXLSX['full_text'].apply(regexp.tokenize)

stopwords = nltk.corpus.stopwords.words("english")

my_stopwords = ['https']
stopwords.extend(my_stopwords)

TweetsXLSX['text_token'] = TweetsXLSX['text_token'].apply(lambda x: [item for item in x if item not in stopwords])

"""

#commento wordcloud
"""
wordcloud = wordcloud(width = 600,
                      height = 400,
                      random_state = 2,
                      max_font_size = 100.generate(all_words_lem))
"""