#Questo file conterrà il codice in python utilizzato per creare grafi dai dataframe creati nel file in R
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import cufflinks as cf
import plotly
import plotly.graph_objs as go
from IPython.display import display


TweetsXLSX = pd.read_excel("C:\\Users\\Jimpo\\Desktop\\SNAgithub\\SocialNetworkAnalysisProject\\Dataframes\\xlsx\\TweetTotali.xlsx")
display(TweetsXLSX)