# Read in Data

source("scripts/rcourse_lesson3_cleaning.R")

## Load Packages
# Nil

## ORGANISE DATA
# Full Season Data
data_stats = data_clean

# Player Specific Data
data_posey_stats = data_posey_clean

## Build Model - Full Season Data
allstar.glm = glm(win ~ allstar_break, family = "binomial", data=data_stats)

allstar.glm_sum = summary(allstar.glm)
allstar.glm_sum


## Build MODEL - PLAYER SPECIFIC DATA
posey_walked.glm = glm(win~walked, family = "binomial", data=data_posey_stats)

posey_walked.glm_sum = summary(posey_walked.glm)
posey_walked.glm_sum
