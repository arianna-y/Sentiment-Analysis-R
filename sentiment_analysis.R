install.packages(c("tidyverse", "tidytext", "tm", "wordcloud", "syuzhet", "dplyr", "tidyr", "conflicted"))

library(tidyverse)
library(tidytext)
library(tm)
library(syuzhet)
library(dplyr)
library(tidyr)
library(conflicted)

# Load dataset
file_path <- "C:/Users/Arianna Yuan/Desktop/Academia/cs projs/Sentiment-Analysis-R/Reviews.csv"
file.exists(file_path)

amazon_reviews <- read.csv(file_path, fileEncoding = "UTF-8", stringsAsFactors = FALSE)
head(amazon_reviews)

colnames(amazon_reviews)

amazon_reviews <- amazon_reviews %>%
  mutate(review_id = row_number()) # create unique ID for each review

# Preprocessing: convert text to lowercase, remove punctuation, stopwords
clean_text <- amazon_reviews %>%
  select(Id, Text) %>%
  mutate(Text = tolower(Text),
         Text = str_replace_all(Text, "[[:punct:]]", ""),
         Text = removeWords(Text, stopwords("en")))

head(clean_text)

# Apply sentiment analysis
sentiment_scores <- clean_text %>%
  unnest_tokens(word, Text) %>%
  inner_join(get_sentiments("bing"), by = "word", relationship = "many-to-many") %>%
  count(Id, sentiment)

# Combine sentiment scores with original reviews
amazon_sentiment <- amazon_reviews %>%
  left_join(sentiment_scores, by = "Id")

head(amazon_sentiment)

# Visualize sentiment scores
sentiment_summary <- amazon_sentiment %>%
  group_by(sentiment) %>%
  summarise(score = mean(n, na.rm = TRUE)) %>%
  arrange(desc(score))
  # pivot_longer(cols = everything(), names_to = "sentiment", values_to = "score")

print(sentiment_summary)

ggplot(sentiment_summary, aes(x = sentiment, y = score, fill = sentiment)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Amazon Reviews Sentiment Analysis", x = "Sentiment", y = "Average Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save results
write.csv(amazon_sentiment, "amazon_reviews_with_sentiment.csv", row.names = FALSE)
