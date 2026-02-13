


library(gtrendsR)
setwd("E:/GT")


###############################################
term_list <- read.table("Search_terms.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )
term_list <- read.table("Autos  and Vehicles.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )
term_list <- read.table("Beauty and Fitness.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )
term_list <- read.table("Business and Industrial.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )
term_list <- read.table("Finance.text", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )
term_list <- read.table("Food and Drink.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )

term_list <- read.csv("Covid19GT.csv", header=TRUE,  stringsAsFactors = FALSE )

term_list <- read.csv("Home and  Garden.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Internet  and Telecom.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Jobs and Education.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Law and Government.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("News.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Real Estate.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Shopping.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Sports.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Travel.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Computers and  Electronics.csv", header=TRUE,  stringsAsFactors = FALSE )

term_list <- read.csv("terms.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("arts and entertainment.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Games.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Books and Literature.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Hobbies and Leisure.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Online Communities.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("People and Society.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Reference.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("Science.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("People and Society.csv", header=TRUE,  stringsAsFactors = FALSE )
term_list <- read.csv("GTmatched.csv", header=TRUE,  stringsAsFactors = FALSE )



# make a terms vector with search terms only

terms  <- list(term_list[ ,2])

#terms <-  c(terms[[1]][1], terms[[1]][2])
str(terms)

summary(terms)
#time = "today3-m"
channel = c("web", "news", "images", "froogle", "youtube")

# We will loop through all items in terms list prepared above.

list.terms.trends <-  list()

for(i in 1:length(terms[[1]])){
  
 

  query <-  terms[[1]][i]
  
  print(query)
  
  gdata <- gtrends(query, geo ="CA",time = "all"

     ,gprop =channel)
  
  Interest.over.time <-  gdata$interest_over_time # extracts Interest over time.
  
  Interest.over.time <-  Interest.over.time[ , ]
  
  list.terms.trends[length(list.terms.trends)+1] <-  list(Interest.over.time)
}


trend<- Filter(function(x) length(x) > 0, list.terms.trends)

str(trend)


all.terms.data <-  as.data.frame (do.call("cbind",  trend))

nm2 <- unlist(all.terms.data[1, grep("^keyword", names(all.terms.data))])
i1 <- grep("^hits", names(all.terms.data))
names(all.terms.data)[i1] <- nm2
i2 <- grep("^(geo|time|keyword|gprop|category|date)", names(all.terms.data))
all.terms.data[i2] <- NULL
time1 <- read.table("dates.txt", header=TRUE, sep <- "\t", stringsAsFactors = FALSE )

all.terms.data$date <- time1


head(all.terms.data)
 write.csv(all.terms.data,  file ="GTnew.csv")
library(digest)
# locate duplicate column names
all.terms.data<- GT[duplicated(lapply(all.terms.data, digest))]

# remove duplicate column names
all.terms.data<- GT[!duplicated(lapply(all.terms.data, digest))]
#all.terms.data <- all.terms.data[ , !duplicated(colnames(all.terms.data))]

write.csv(all.terms.data, paste0("D:/GT/output/", "all.terms.data ",  ".csv"))

#######################
