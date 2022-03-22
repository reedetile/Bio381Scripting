#Description-----------------------------------------
#description of script
#  17 Mar 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------


# Global Variables-------------------------------------


# Program Body------------------------------------------






























path.root <- 'D:/OneDrive - University of Vermont/Classes/Spring2022/CompBio/Bio381Scripting'
setwd('D:/OneDrive - University of Vermont/Classes/Spring2022/CompBio/Bio381Scripting/functions')
library(ggplot2)
# source('my_functions.R')
source('get_data.R')
source('calculate_stuff.R')
source('summarize_output.R')
source('graph_results.R')
# pros of source function = can create library of personal functions
# con = can't actually see coding
get_data()
calculate_stuff()
summarize_output()
graph_results()

#global variables#
x_col <- 7 #column 7 latitude center of each county
y_col <- 5 #column 5 number of ant spp
ant_file <- "Clean_data/antcountydata.csv" #New England ant county data

#program body#
setwd(path.root)
temp1 <- get_data(file_name = ant_file) #construct data frame
pred <- temp1[,x_col] #extract predictor var
res <- temp1[,y_col] #extract response var

temp2 <- calculate_stuff(x_var = pred, y_var = res)
temp3 <- summarize_output(temp2)
temp3
graph_results(x_var = pred,y_var=res)

print(temp2)
print(temp3)
