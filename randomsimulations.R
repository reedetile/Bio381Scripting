#Description-----------------------------------------
#Practicing simulations
#  05 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------
list <- c('functions/get_data.R','functions/get_data.R'
source('functions/get_data.R')
source('functions/calculate_stuff.R')

# Global Variables-------------------------------------


# Program Body------------------------------------------
#-------------------running simulations--------------------#
n_sim <- 1000
x_sim <- rep(NA,n_sim)
df <- get_data()
for (i in seq_len(n_sim)){
  x_sim[i] <- calculate_stuff(shuffle_data(df)) #don't know where shuffle_data is
}

slopes <- list(x_obs,x_sim)
get_pval(slopes) #don't know where get_pval is
plot_ran_test(slopes) #don't know where plot_ran_test is from??