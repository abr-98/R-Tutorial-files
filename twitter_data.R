library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

consumer_key <- 'xAhTppgTiK4jZL9fDteVgzAnG'
consumer_secret <- '6JsIxDYZ9wxU8g9twIg2fkeFz3kkZfQdLufaAaCt0pn5acgUs9'
access_token <- '940549662242586625-50LrVtQupBmfO8wnoA3kfqaJ9vdJCtG'
access_secret <- 'USt8PPRTyJyhvxwJpNtNxobjNRd95fft4IUNakjtFA2L5'
 
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline("realDonaldTrump", n=200)
 
n.tweet <- length(tweets)

tweets.df <- twListToDF(tweets) 
 
head(tweets.df)

head(tweets.df$text)



tweets.df2 <- gsub("http.*","",tweets.df$text)
 
tweets.df2 <- gsub("https.*","",tweets.df2)
 
tweets.df2 <- gsub("#.*","",tweets.df2)
 
tweets.df2 <- gsub("@.*","",tweets.df2)

word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)

word.df <- as.vector(tweets.df2)
 
emotion.df <- get_nrc_sentiment(word.df)
 
emotion.df2 <- cbind(tweets.df2, emotion.df) 
 
head(emotion.df2)

sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.positive

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

positive.tweets <- word.df[sent.value > 0]
head(positive.tweets)

negative.tweets <- word.df[sent.value < 0]  
head(negative.tweets)

neutral.tweets <- word.df[sent.value == 0] 
head(neutral.tweets)
 

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))

head(category_senti)

neutral.tweets <- word.df[sent.value == 0] 
head(neutral.tweets)
