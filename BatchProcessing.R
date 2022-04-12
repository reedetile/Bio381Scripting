#Description-----------------------------------------
#Batch processing w/ many input files
#  05 Apr 2022
#RCS

#Initialize -----------------------------------------
library(tidyverse)
# set.seed(1234)

#library(TeachingDemos)
#char2seed('espress withdrawl')
#char2seed('espress withdrawl', set=FALSE)

# Load functions--------------------------------------
#######################################################
# FUNCTION: file_builder
# Purpuse:create a set of random files for regression
#input:file_n = number of files to create
#               file_folder = name of folder for random files
#               file_size = c(min,max) number of rows in file
#               file_na = number on avg of NA values per column
#output: set of random files
#-----------------------------------------------------
file_builder <- function(file_n = 10,
                         file_folder = 'RandomFiles/',
                         file_size = c(15,100),
                         file_na = 3) {
  for (i in seq_len(file_n)){
    file_length <- sample(file_size[1]:file_size[2],size=1)
    var_x <- runif(file_length)
    var_y <- runif(file_length)
    df <- data.frame(var_x,var_y)
    bad_vals <- rpois(n=1,lambda = file_na)
    df[sample(nrow(df),size=bad_vals),1]<-NA #random na in var_x
    df[sample(nrow(df),size=bad_vals),2]<-NA #random na in var_y
    
    #create label for file name with padded zeroes
    file_label <- paste(file_folder, 
                        "ranFile",
                        formatC(i,
                                width = 3,
                                format="d",
                                flag = '0'),
                        '.csv',sep='')
  #set up data file and incorporate time stamp + minimal metadata
    write.table(cat("a simulated random data file for batch processing",'\n','# timestamp',
                    as.character(Sys.time()),'\n','RCS','\n','#--------------------------',
                    '\n','\n',file = file_label,row.names = '',col.names='',sep=''))
    #now add the data frame
    write.table(x=df,file=file_label,sep=',',row.names=FALSE,append=TRUE)
  }
}

#######################################################
# FUNCTION: reg_stats
# Purpuse:provide regression statistics
#input:d
#output:
#-----------------------------------------------------
reg_stats <- function(d=NULL) {
  if(is.null(d)){
    x_var <- runif(10)
    y_var <- runif(10)
    d <- data.frame(x_var,y_var)
  }
  . <- lm(data=d,d[,2]~d[,1])
  . <- summary(.)
  stats_list <- list(slope=.$coefficients[2,1],
                     p_val = .$coefficents[2,4],
                     r2 <- .$r.squared)
  return(stats_list)
}



# Global Variables-------------------------------------
file_folder <- 'RandomFiles/'
n_files <- 100
file_out <- 'Stats.Summary.csv'

# Program Body------------------------------------------
#Create 100 random data sets
dir.create(file_folder) #create a folder
file_builder(file_n = n_files) #creates files! using a homemade function
file_names <- list.files(path=file_folder)
head(file.names)

#Create data frame to hold file summary statistics
ID <- seq_along(file_names)
file_name <- file_names
slope <- rep(NA,n_files)
p_val <- rep(NA,n_files)
r2 <- rep(NA,n_files)

stats_out <- data.frame(ID,file_name,slope,p_val,r2)
for (i in seq_along(file_names)){
  data <- read.table(file=paste(file_folder,file_names[i],sep=''),
                     sep = ',',
                     header=TRUE) # read in next data file
  d_clean <- data[complete.cases(data),] #get clean cases
  . <- reg_stats(d_clean) #pull regression stats from clean file
  stats_out[i,3:5] <- unlist(.) #unlist, copy into last 3 columns
}
