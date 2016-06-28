# Read in Data

source("scripts/rcourse_lesson3_cleaning.R")

# load packages
library(ggplot2)
# Full season Data

data_figs = data_clean %>%
            mutate(allstar_break= factor(allstar_break, levels=c("before", "after")))

# Summarise full season data by All-Star break
data_figs_sum = data_figs %>%
                group_by(allstar_break) %>%
                summarise(wins_perc=mean(win)*100) %>%
                ungroup()

# Player specific data
data_posey_figs = data_posey_clean

data_posey_figs_sum = data_posey_figs %>% 
                      group_by(walked) %>%
                      summarise(wins_perc=mean(win)*100) %>%
                      ungroup()

# Make Figures
allstar.plot = ggplot(data_figs_sum, aes(x=allstar_break, y=wins_perc)) +
               geom_bar(stat="identity") + ylim(0,100)

pdf("figures/allstar.pdf")
allstar.plot
dev.off()


# Posey Walked or Not

posey_walked.plot = ggplot(data_posey_figs_sum, aes(x=walked, y=wins_perc)) +
                    geom_bar(stat="identity") + ylim(0,100)
pdf("figures/posey_walked.pdf")
posey_walked.plot
dev.off()

