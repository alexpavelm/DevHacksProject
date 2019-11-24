from newsapi import NewsApiClient
from textblob import TextBlob
import nltk
from newspaper import Article
# Init
newsapi = NewsApiClient(api_key='b9dd309839d046368cd57f251c2f838e')

# /v2/top-headlines
all_articles = newsapi.get_everything(q='nvidia',
                                      from_param='2019-11-16',
                                      to='2019-11-23',
                                      language='en',
                                      sort_by='relevancy')

# /v2/sources
for source in all_articles['articles']:
    article = Article(source['url'])
    article.download()
    article.parse()
    nltk.download('punkt')
    article.nlp()
    text = article.summary.encode('utf-8').strip()
    print(text + '\n')

