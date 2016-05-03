#import necessary libraries
library(RCurl) #for reading the url from github
library(ggplot2) #for plotting

#read in myanmar_merged_v3 file from github
x <- getURL("https://raw.githubusercontent.com/kes4052/INFX575LA/master/myanmar_merged_v3.csv")

#coding blanks and 0 values as NA in R
myanmar <- read.csv(text = x, header=T, na.strings=c(""," ",0,"NA"))

#removing na values from target columns only
myanmar_sub_cand_party <- na.omit(myanmar["cand_party_cleaned"])
myanmar_sub_party_type <- na.omit(myanmar["party_type"])
myanmar_sub_occ_recode <- na.omit(myanmar["lu_occrecode"])
myanmar_sub_hidegrecode <- na.omit(myanmar["lu_hidegrecode"])
myanmar_sub_gen <- na.omit(myanmar["lu_gen"])


#replacing values in occ_recode column that didn't import right into R
myanmar_sub_occ_recode$lu_occrecode <- gsub("politician", "Politician", myanmar_sub_occ_recode$lu_occrecode)
myanmar_sub_occ_recode$lu_occrecode <- gsub("Politician ", "Politician", myanmar_sub_occ_recode$lu_occrecode)
myanmar_sub_occ_recode$lu_occrecode <- gsub("Private company staff", "Private Company staff", myanmar_sub_occ_recode$lu_occrecode)

#plotting histograms with ggplot
ggplot(myanmar_sub_cand_party, aes(x = cand_party_cleaned)) + 
  geom_histogram(colour = "#01665e", fill = "#c7eae5") + 
  theme(text = element_text(size=8),
  axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("party") + ggtitle("Histogram of Candidate Parties")
  ggsave("hist_party.png")

ggplot(myanmar_sub_party_type, aes(x = party_type)) + 
  geom_histogram(colour = "#01665e", fill = "#c7eae5") + 
  theme(text = element_text(size=12),
  axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("party type") + ggtitle("Histogram of Candidate Party Types")
  ggsave("hist_party_type.png")

ggplot(myanmar_sub_occ_recode, aes(x = lu_occrecode)) + 
  geom_histogram(colour = "#01665e", fill = "#c7eae5") + 
  xlab("occupation") + ggtitle("Histogram of Candidate Occupations")
  ggsave("hist_occupation.png")

ggplot(myanmar_sub_hidegrecode, aes(x = lu_hidegrecode)) +
  geom_histogram(colour = "#01665e", fill = "#c7eae5") + 
  xlab("highest degree") + ggtitle("Histogram of Candidate Highest Degree")
  ggsave("hist_hidegree.png")


ggplot(myanmar_sub_gen, aes(x = lu_gen)) +
  geom_histogram(colour = "#01665e", fill = "#c7eae5") + 
  xlab("gender") + ggtitle("Histogram of Candidate Gender")
  ggsave("hist_gender.png")

ggplot(myanmar, aes(x = lu_age)) + 
      geom_histogram(colour = "#01665e", fill = "#c7eae5", binwidth = 10) + 
      scale_x_continuous(breaks = c(10,20,30,40,50,60,70,80,90,100)) + 
      xlab("age") + ggtitle("Histogram of Candidate Ages")
      ggsave("hist_age.png")

