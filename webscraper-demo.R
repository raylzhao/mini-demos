## Let's make a webscraper!
## Sources:
##   https://www.analyticsvidhya.com/blog/2017/03/beginners-guide-on-web-scraping-in-r-using-rvest-with-hands-on-knowledge/
##   https://www.rdocumentation.org/packages/rvest/versions/0.3.2/topics/html_nodes
##   https://www.rdocumentation.org/packages/rvest/versions/0.3.2/topics/html_text


## Uncomment this to install packages
install.packages('rvest')

# Load in 'rvest' package
library('rvest')

'Specify the URL endpoint we are using'
url <- 'http://www.imdb.com/search/title?count=100&release_date=2016,2016&title_type=feature'
webpage <- read_html(url)

#html_nodes: More easily extract pieces out of HTML documents using XPath and css selectors
#html_text: Extract attributes, text and tag name from html.

rank_data_html <- html_nodes(webpage,'.text-primary')
rank_data <- html_text(rank_data_html)

head(rank_data)

rank_data <- as.numeric(rank_data)
head(rank_data)

#Using CSS selectors to scrape the title section
title_data_html <- html_nodes(webpage, ".lister-item-header a")

#html to text 
title_data <- html_text(title_data_html)

#look at data
head(title_data)

#Using CSS selectors to scrape the description section
description_data_html <- html_nodes(webpage, ".ratings-bar+ .text-muted")
#Converting the description data to text
description_data <- html_text(description_data_html)
#look at data
head(description_data)
#Data-Preprocessing: removing '\n'
description_data <- gsub("\n","", description_data)
#Using CSS selectors to scrap the Movie runtime section
runtime_data_html <- html_nodes(webpage, ".text-muted .runtime")
#Converting the movie runtime data to text
runtime_data <- html_text(runtime_data_html)
#Let's have a look at the movie runtime
head(runtime_data)
#Data-Preprocessing: removing mins and converting it to numerical
runtime_data <- gsub(" min", "", runtime_data)
runtime_data <- as.numeric(runtime_data)
#Let's have another look at the runtime data
head(runtime_data)

#Converting the genre data to text
genre_data_html <- html_nodes(webpage, ".genre")
genre_data <- html_text(genre_data_html)
#Let's have a look at the genre
head(genre_data)
#Data-Preprocessing: removing \n
genre_data <- gsub("\n", "", genre_data)
head(genre_data)
#Data-Preprocessing: removing excess spaces

#taking only the first genre of each movie

#Convering each genre from text to factor

#Let's have another look at the genre data

#Using CSS selectors to scrap the IMDB rating section

#Converting the ratings data to text

#Let's have a look at the ratings

#Data-Preprocessing: converting ratings to numerical

#Let's have another look at the ratings data


#Using CSS selectors to scrap the directors section

#Converting the directors data to text

#Let's have a look at the directors data

#Data-Preprocessing: converting directors data into factors

#Using CSS selectors to scrap the actors section

#Converting the gross actors data to text

#Let's have a look at the actors data

#Data-Preprocessing: converting actors data into factors

#Using CSS selectors to scrap the gross revenue section

#Converting the gross revenue data to text

#Let's have a look at the votes data


#Data-Preprocessing: removing '$' and 'M' signs


#Let's check the length of gross data
length(gross_data)



#Filling missing entries with NA


#Data-Preprocessing: converting gross to numerical

#Let's have another look at the length of gross data


library('ggplot2')

# let's draw some plots!
