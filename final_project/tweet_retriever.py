from dotenv import load_dotenv
import os
import tweepy

load_dotenv()
consumer_key = os.getenv("CONSUMER_KEY")
consumer_secret = os.getenv("CONSUMER_KEY_SECRET")
acess_token = os.getenv("ACCESS_TOKEN")
acess_token_secret = os.getenv("TOKEN_SECRET")

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(acess_token, acess_token_secret)

api = tweepy.API(auth)

query = "best movie"
max_tweets = 10

tweets = [t for t in tweepy.Cursor(api.search_tweets, q=query, lang="en").items(max_tweets)]

print(tweets)

with open("tweets.txt", "w", encoding="utf-8") as f:
    for tweet in tweets: f.write(tweet.text + "\n")