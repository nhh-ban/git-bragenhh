# Skeleton file 2 for Assignment 1 in BAN400. 
# -------------------------------------------
# Problem 2

library(tidyverse)    # Contains most of what we need.
library(ggplot2)

# Reading text
raw_file <- readLines(con = "suites_dw_Table1.txt")

# Extracts first two characters from each element
substr(x = raw_file, start = 1, stop = 2)

# Finds where the separate line is
L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  which(raw_file) %>% 
  min()

# Method from course BAN432
# Making a data frame 
df <- read_delim("suites_dw_Table1.txt", delim = "|", col_names = T, skip = L-2) # skips the variable description
df <- df[-1,] # skips the separate line 

# Saving the variable descriptions 
cat(raw_file[1:(L-2)], sep = "\n", file = "saving variables")

# Saving the data frame 
write.csv(df, file = "dataframe.csv")

read <- read_csv("dataframe.csv")

# Problem 3
# My physics skills might be failing me, but it would seem that smaller objects 
# are not under-represented in the sample.
read %>%  
  ggplot(aes(y= a_26, x = D)) +
  geom_point() +
  labs(y = "Diameter of the galaxy", #
       x = "Distance to the galaxy") +
  theme_classic() 

