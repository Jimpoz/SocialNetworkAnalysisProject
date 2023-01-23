#Questo file conterrà il codice in python utilizzato per creare grafi dai dataframe ricavati nel codice in R
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import cufflinks as cf
import plotly
import plotly.graph_objs as go
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

ttdf = pd.read_csv("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\csv\\tt.csv")
#display(TweetsXLSX)

ttdf.head()

x = ttdf['full_text']
y = ttdf['id']

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