# Amazon Reviews Sentiment Analysis with R
This project analyzes the sentiment of Amazon product reviews using R. The analysis uses natural language processing (NLP) techniques, including text preprocessing and sentiment scoring, to classify and visualize the sentiment of product reviews.

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
3. [Data](#data)
4. [Analysis](#analysis)
5. [Results](#results)

## Installation
### Prerequisites
To run this project, you will need to install the necessary packages. You can install them by running the following command in R:

```install.packages(c("tidyverse", "tidytext", "tm", "wordcloud", "syuzhet", "dplyr", "tidyr", "conflicted"))```

## Usage
1. Clone or download the repository to your local machine
2. Place the `Reviews.csv` file in the appropiate directory or update the file path in the R script (`Sentiment-Analysis-R.R`)
3. Open the R script in preferred R editor
4. Run the script to:
     - Preprocess the reviews
     - Apply sentiment analysis using the Bing sentiment lexicon
     - Visualize the sentiment scores

## Data
The dataset used in this project is the Amazon Reviews dataset, which can be found here: https://www.kaggle.com/code/danielbeltsazar/amazon-review-sentiment-analysis/input

The dataset contains the following columns:
- `Id`: The unique identifier for each review
- `ProductId`: The identifier for the product being reviewed
- `UserId`: The identifier for the user who submitted the review
- `ProfileName`: The profile name of the user
- `HelpfulnessNumerator`: The number of helpful votes for the review
- `HelpfulnessDenominator`: The total number of votes for the review
- `Score`: The rating given by the user (1-5 scale)
- `Time`: The timestamp of the review
- `Summary`: A brief summary of the review
- `Text`: The full text of the review

## Analysis
This project performs the following steps:
1. Preprocessing:
   - Converts the review text to lowercase
   - Removes punctuation and stop words (common words such as "the", "is", etc.)
2. Sentiment Analysis:
   - Uses the Bing sentiment lexicon to classify words in the reviews as positive or negative
   - Aggregates the sentiment counts per review
3. Visualization:
   - Plots a bar chart to visualize the average sentiment scores across all reviews

## Results
After running the script, the results will be saved as `amazon_reviews_with_sentiment.csv`, which contains the original reviews along with their sentiment scores.
