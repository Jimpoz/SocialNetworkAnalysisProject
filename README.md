# Social Network Analysis project

This is a brief introduction to the project that we worked on the the Social Network Analysis course at the university of venice Ca' Foscari

The project is a sentiment analysis of Twitter users

## The Idea behind the Project

We came up with the idea of analysing the emotion and behaviour of users on a social media platform towards the end of the year 2022 when we witnessed countless environmental activists attacking paintings inside museums.

## What exactly are we analysing?

First we picked four specific incidents that happened in 4 different countries to work with which happened at the following museums:
- Louvre
- Uffizi Gallery
- National Gallery of Art
- Prado's Museum

Each event involves an environmental activist trying to convey their message to prevent the climate crisis through their actions by damaging pieces of art that were displayed inside very famous museums.

First of all the social media we decided to work on is Twitter with to the following library:

```
pip install SNScrape

import snscrape.modules.twitter as sntwitter
```

Thanks to this library we were able to scrape older tweets since the Twitter API V2 had a limit of 7 days.

After collecting the necessary data we decided to observe the users behaviour and their expressed emotions through various NLP algorithms such as TextBlob
( ``` import TextBlob ``` ) and Vader:
``` 
#downloading the vader lexicon
nltk.download('vader_lexicon')

#importing the vader sentiment analyzer
from nltk.sentiment.vader import SentimentIntensityAnalyzer

#create a sentiment analyzer object
sent_analyzer = SentimentIntensityAnalyzer()
```

Both of the previous mentioned algorithms estimate the polarity and emotion expressed by a user through an analysis of the tweet text

We decided to use the Vader algorithm since it is slightly more accurate than TextBlob

## How?

For each event the data collected has been split into 2 periods: 15 days before the event and 15 days after.

For every period there will be:
- Mention Network
- MRE (Most Relevant Emotion per user)
- Histograms
- Networks
- Clustered Networks
- Etc...

***
Example of data visualization with gephi:

![Mention_network_D5](https://user-images.githubusercontent.com/79638739/225742930-a8321e6e-ffa4-4ae7-83bc-07355fd667b6.png)

***

After this kind of analysis we also compared the MRE analysis of the period before and after to determine if there has been some changes in users opinions, for example:
***
Here below we can see the MRE bar char that represents the most relevant emotions per user regarding the first event in the list mentioned earlier followed by a pie chart that displays how many have changed their opinion after the incident occurred

![MRE_before_after](https://user-images.githubusercontent.com/79638739/225742401-6e20b942-e8a8-4762-a519-53aa7f6de872.png)
![Percentage_Change](https://user-images.githubusercontent.com/79638739/225742406-841ee6cd-d9fd-4d21-a63a-00863fd5f97a.png)

***

## What are we trying to answer?

We asked ourselves if there really was this need to damage pieces of art in order to make some people acknowledge the climate crisis and observed if it really had an impact on the twitter community.
