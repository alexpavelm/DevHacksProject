from textblob import TextBlob

f = open("nvidia.txt", "r")
articles = f.read().decode('utf-8').strip()
list = articles.split("\n\n")

f.close()
average = 0.0;
for source in list:
    obj = TextBlob(source)
    sentiment = obj.sentiment.polarity
    average += sentiment;
    print(sentiment)
average = average / len(list)
print("average is " + str(average))