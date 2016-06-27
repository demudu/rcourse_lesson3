#Load Packages
library(dplyr)

# read in full season Data

data = read.table("data/rcourse_lesson3_data.txt", header = T, sep='\t')

# read in Buster Posey Data
data_posey = read.table("data/rcourse_lesson3_data_posey.txt", header=T, sep="\t")

data_clean = data %>% 
             mutate(home_visitor=ifelse(home_team=="SFN", "home", "visitor")) %>%
             mutate(allstar_break =ifelse(date < 20100713, "before", "after")) %>% 
             mutate(win=ifelse(home_team=="SFN" & home_score > visitor_score, 1,
                       ifelse(visitor_team=="SFN" & home_score < visitor_score, 1,0)))

data_posey_clean = data_posey %>%
                   inner_join(data_clean) %>%
                   mutate(walked=ifelse(walks>0, "yes", "no"))
